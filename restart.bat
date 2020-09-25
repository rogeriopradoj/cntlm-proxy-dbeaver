rem tenta reiniciar o computador depois de 12h, mas só se estiver na janela
rem caso não estiver na janela, espera mais 1h e tenta novamente, até entrar na janela

rem https://stackoverflow.com/questions/1672338/how-to-sleep-for-five-seconds-in-a-batch-file-cmd
timeout /t 43200 /nobreak

goto verificar_janela
goto end



:verificar_janela

rem https://stackoverflow.com/questions/14456204/batch-file-that-runs-only-during-a-specific-time
rem se entre: 0 e 6, reiniciar_agora. 
rem caso contrario, esperar proxima janela
for /f "tokens=1-3 delims=:" %%a in ("%time%") do if %%a geq 0 if %%a leq 16 goto reiniciar_agora

goto esperar_mais_uma_hora
goto end


:reiniciar_agora

echo shutdown /r

goto end


:esperar_mais_uma_hora

timeout /t 3600 /nobreak

goto verificar_janela
goto end

:end
