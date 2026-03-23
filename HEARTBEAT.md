# HEARTBEAT.md

# 定期任务清单（每次心跳检查）

## CHAT 提醒系统检查（每 30 分钟）
```bash
# 自动修复遗漏的 cron job
python3 ~/.openclaw/skills/chat-memory/scripts/fix_missing_crons.py --silent

# 检查并自动发送已过期提醒
python3 ~/.openclaw/skills/chat-memory/scripts/check_reminders.py --auto-send
```

# 其他定期任务可在此添加
# 例如：邮件检查、日历检查等
