def isleap(year):
	if year%400==0:
		return True
	if year%100!=0 and year%4==0:
		return True
	return False

def Next_day(year,month,day):
	bigmonth = [1,3,5,7,8,10,12]
	smallmonth = [4,6,9,11]
	if (day==31 and month in bigmonth) or (day==30 and month in smallmonth):
		day = 1
		month += 1
		if month == 13:
			month = 1
			year += 1
		return [year,month,day]
	if (isleap(year) and day==29) or (not isleap(year) and day==28):
		day=1
		month=3
		return [year,month,day]
	return year, month, day+1

def main():
	print(Next_day(2020,2,29))

if __name__ == '__main__':
	main()

