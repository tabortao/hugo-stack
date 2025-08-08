@echo off
:: 设置控制台代码页为UTF-8
chcp 65001 > nul

echo.
echo Creating a new post with a timestamp filename...
echo.

:: 使用 wmic 获取一个与区域设置无关的日期时间字符串 (格式: YYYYMMDDHHMMSS.ffffff)
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I

:: 提取年、月和精确到秒的时间戳
set year=%datetime:~0,4%
set timestamp=%datetime:~0,14%

:: 构建文件夹路径和文件名
:: 最终路径格式: posts/2024/20240808153012.md
set file_path=posts/%year%/%timestamp%.md

:: 显示将要执行的命令
echo Hugo command to be executed:
echo hugo new "%file_path%"
echo.

:: 执行 hugo new 命令
hugo new "%file_path%"

echo.
echo Done. File created at: content\%file_path%
@REM pause
