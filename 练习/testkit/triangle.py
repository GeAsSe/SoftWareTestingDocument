import math

def is_positive_number(s):
    if isinstance(s,int) or isinstance(s,float):
    	if s>0:
    		return True
    return False

def triangle(a,b,c):
	if is_positive_number(a) and is_positive_number(b) and is_positive_number(c):
		if a<b+c and b<a+c and c<a+b:
			if a==b==c:
				return "Pass: Equilateral"
			elif a==b or b==c or c==a:
				return "Pass: Isosceles"
			else:
				return "Pass: Ordinary"
		else:
			return "Fail: Not Triangle"
	else:
		return "Error: TypeError"

def main():
	print(triangle(1,1,1))

if __name__ == '__main__':
	main()