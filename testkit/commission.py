def compute(case, monitor, device):
    total = case*25 + monitor*30 + device*45
    bonus = 0
    print("本月的销售金额为" + str(total) + "元")
    if total > 1800:
        bonus = (total - 1800)*0.2 + 800*0.15 + 1000*0.1
    elif total > 1000:
        bonus = (total - 1000)*0.15 + 1000*0.1
    else:
        bonus = total*0.1
    print("本月的业绩奖金为" + str(bonus) + "元")
    return bonus

def Commission(case=0,monitor=0,device=0):
    try:
        if not isinstance(case,int) or not isinstance(monitor,int) or not isinstance(device,int):
            return "Error: TypeError"
        if case<0 or case>70:
            return "Error: case OutOfBound"
        if monitor<0 or monitor>80:
            return "Error: monitor OutOfBound"
        if device<0 or device>90:
            return "Error: device OutOfBound"
        else:
            return compute(case, monitor, device)
    except:
        return "Error: Unknown"

def main():
    print(Commission(70,80,90))
    a=10

if __name__ == '__main__':
    main()