@echo off
chcp 65001 >nul

echo ==============================================
echo   DOCX → TEX 自動変換（Pandoc）
echo ==============================================

rem ----- メディアフォルダ初期化 -----
if exist media (
    rmdir /s /q media
)
mkdir media

rem ----- DOCX → TEX 変換 -----
for %%F in (cover chapter1 chapter2 chapter3 chapter4 chapter5 chapter6 chapter7 appendix) do (
    if exist %%F.docx (
        echo 変換: %%F.docx → %%F.tex
        pandoc "%%F.docx" -o "%%F.tex" --extract-media=media
    ) else (
        echo スキップ: %%F.docx （存在しません）
    )
)

echo.
echo ==============================================
echo   PDF 生成（LuaLaTeX）
echo ==============================================

lualatex thesis_template.tex
lualatex thesis_template.tex

echo.
echo ===== 完了 =====
pause
