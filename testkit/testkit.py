import tkinter as tk
import tkinter.filedialog
import tkinter.messagebox
import tkinter.ttk as ttk
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.pyplot as plt
import numpy as np

from triangle import triangle
from next_day import Next_day
from commission import Commission


class TestWindow():
	def __init__(self, window):
		self._window = window

# 测试窗口布局
	def layout_window(self):
		# 初始化
		self._data_path = None
		self._result = ""
		# 简单设置窗口
		self._window.title = "Software Test Kit"
		self._window.geometry('900x600')
		# 添加指示标签
		self._program_label = tk.Label(self._window, text="待测程序", font=('Microsoft YaHei',10))
		self._program_label.place(x=70,y=10)
		self._data_label = tk.Label(self._window, text="测试数据", font=('Microsoft YaHei',10))
		self._data_label.place(x=400,y=10)
		self._result_label = tk.Label(self._window, text="测试结果", font=('Microsoft YaHei',10))
		self._result_label.place(x=40,y=90)

		# 添加待测程序下拉框
		self._program_choose = ttk.Combobox(self._window)
		self._program_choose['value'] = ('next_day', 'triangle','commission') # 设置待测程序
		self._program_choose.place(x=50,y=40)
		self._program_choose.current(0)
		# 添加文件选择器
		self._data_choose = ttk.Button(self._window, text="选择测试数据",command=self.OpenfileSelector)
		self._data_choose.place(x=400,y=40)
		# 添加结果显示面板
		self._result_text = tk.Text(self._window,width=48,height=22,bd=5,state="disabled",font=('Microsoft YaHei',10))
		self._result_text.place(x=40,y=120)
		# 添加统计图面板
		self._fig,self._axes=plt.subplots(2,1,figsize=(3.5,4.5),facecolor='#ccddef')
		self._canvas = FigureCanvasTkAgg(self._fig, self._window)
		self._canvas.get_tk_widget().place(x=500, y=100)
		self._canvas.draw()
		# 添加测试按钮
		self._test_button = ttk.Button(self._window, text="开始测试", command=self.RunTest)
		self._test_button.place(x=660,y=40)

	def OpenfileSelector(self):
		self._data_path = tk.filedialog.askopenfilename(title='选择数据')
		self._data_label["text"] = self._data_path.split('/')[-1].split('.')[0]

	def RunTest(self):
		if self._data_path == None:
			tk.messagebox.showerror(title='错误', message='请选择测试数据！')
			return

		self._data = pd.read_excel(self._data_path)
		# 三角问题
		if self._program_choose.get() == 'triangle':
			self.testTriangle()
		# 日历问题
		elif self._program_choose.get() == 'next_day':
			self.testNextDay()
		# 佣金问题
		elif self._program_choose.get() == 'commission':
			self.testCommission()
		return

	def testTriangle(self):
		self._result_text["state"] = "normal"
		self._result_text.delete(0.0,tk.END)
		self._result_text.insert(tk.END,"Test Reselt \t\t\t Expected\n")
		self._result_text["state"] = "disabled"
		P,F,E = 0,0,0
		for i in range(len(self._data)):
			result = triangle(int(self._data.iloc[i][0]),int(self._data.iloc[i][1]),int(self._data.iloc[i][2]))
			print(result)
			if result.startswith("Pass"):
				P=P+1
			elif result.startswith("Fail"):
				F=F+1
			elif result.startswith("Error"):
				E=E+1
			self._result_text["state"] = "normal"
			self._result_text.insert(tk.END, result + "\t\t\t" + self._data.iloc[i][3]+"\n")
			self._result_text["state"] = "disabled"
		self._axes[0].clear()
		self._axes[1].clear()
		self._axes[0].bar(("Pass","Fail","Error"),(P,F,E))
		self._axes[1].pie([P,F,E], labels=["正确", "错误", "异常"], startangle=90, counterclock=False)
		self._canvas.draw()

	def testNextDay(self):
		self._result_text["state"] = "normal"
		self._result_text.delete(0.0,tk.END)
		self._result_text.insert(tk.END,"Test Reselt \t\t\t Expected\n")
		self._result_text["state"] = "disabled"
		P,F=0,0
		for i in range(len(self._data)):
			result = Next_day(int(self._data.iloc[i][0]),int(self._data.iloc[i][1]),int(self._data.iloc[i][2]))
			self._result_text["state"] = "normal"
			self._result_text.insert(tk.END, str(result[0])+","+str(result[1])+","+str(result[2]) + "\t\t\t" + str(self._data.iloc[i][3]) + "," + str(self._data.iloc[i][4]) + "," + str(self._data.iloc[i][5]) + "\n")
			self._result_text["state"] = "disabled"
			if result[0] == self._data.iloc[i][3] and result[1] == self._data.iloc[i][4] and result[2] == self._data.iloc[i][5]:
				P=P+1
			else:
				F=F+1
		self._axes[0].clear()
		self._axes[1].clear()
		self._axes[0].bar(("Pass","Fail"),(P,F))
		self._axes[1].pie([P,F], labels=["正确", "错误"], startangle=90, counterclock=False)
		self._canvas.draw()

	def testCommission(self):
		self._result_text["state"] = "normal"
		self._result_text.delete(0.0,tk.END)
		self._result_text.insert(tk.END,"Test Reselt \t\t\t Expected\n")
		self._result_text["state"] = "disabled"
		P,F,E=0,0,0
		for i in range(len(self._data)):
			result = Commission(int(self._data.iloc[i][0]),int(self._data.iloc[i][1]),int(self._data.iloc[i][2]))
			self._result_text["state"] = "normal"
			self._result_text.insert(tk.END,str(result) + "\t\t\t" + str(self._data.iloc[i][3]) + "\n")
			self._result_text["state"] = "disabled"
			if str(result).find("Unknown") >= 0:
				E = E+1
			elif str(result).find("Error") >= 0:
				F = F+1
			elif float(result) == self._data.iloc[i][3]:
				P = P+1
		self._axes[0].clear()
		self._axes[1].clear()
		self._axes[0].bar(("Pass","Fail","Error"),(P,F,E))
		self._axes[1].pie([P,F,E], labels=["正确", "错误", "异常"], startangle=90, counterclock=False)
		self._canvas.draw()


def main():
	plt.rcParams['font.sans-serif']=['SimHei']

	window = tk.Tk()
	Testpad = TestWindow(window)
	Testpad.layout_window()
	window.mainloop()

if __name__ == '__main__':
	main()

