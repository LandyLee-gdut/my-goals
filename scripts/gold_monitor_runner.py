#!/usr/bin/env python3
"""
黄金价格监控脚本
检查金价是否触及设定的阈值
"""
import sys

# 阈值设置
BUY_1 = 4250  # 第一批买入
BUY_2 = 4150  # 第二批买入
STOP_LOSS = 4000  # 止损
TAKE_PROFIT = 4700  # 止盈

def check_price(price):
    """检查金价是否触发阈值"""
    alerts = []
    
    # 检查各个阈值
    if price <= STOP_LOSS:
        alerts.append(f"🚨 止损触发！金价跌至 {price} USD，已达到止损点 {STOP_LOSS}")
    elif price <= BUY_2:
        alerts.append(f"💰 第二批买入信号！金价 {price} USD，低于第二批买入点 {BUY_2}")
    elif price <= BUY_1:
        alerts.append(f"💰 第一批买入信号！金价 {price} USD，低于第一批买入点 {BUY_1}")
    
    if price >= TAKE_PROFIT:
        alerts.append(f"🎯 止盈触发！金价涨至 {price} USD，已达到止盈点 {TAKE_PROFIT}")
    
    # 计算距离各阈值的百分比
    pct_to_buy1 = ((price - BUY_1) / BUY_1) * 100
    pct_to_stop = ((price - STOP_LOSS) / STOP_LOSS) * 100
    
    return alerts, pct_to_buy1, pct_to_stop

def main():
    if len(sys.argv) < 2:
        print("用法: python3 gold_monitor_runner.py <金价>")
        sys.exit(1)
    
    try:
        price = float(sys.argv[1])
    except ValueError:
        print("错误: 金价必须是数字")
        sys.exit(1)
    
    alerts, pct_to_buy1, pct_to_stop = check_price(price)
    
    # 输出距离阈值的百分比（供外部解析）
    print(f"[PCT_TO_BUY1]{pct_to_buy1:.2f}")
    print(f"[PCT_TO_STOP]{pct_to_stop:.2f}")
    
    if alerts:
        print("[GOLD_ALERT_START]")
        for alert in alerts:
            print(alert)
        print("[GOLD_ALERT_END]")
        sys.exit(0)
    else:
        print("[NO_ALERT] 金价处于正常区间，无触发信号")
        sys.exit(0)

if __name__ == "__main__":
    main()
