@echo off
:RESTART
type hynse

color 0b
echo Server are starting...
::-----------------------------------------
:: Setting
SET Band=Hynse
SET Instance=Survival
SET ServerJar=purpur-1.19.3-1905
SET Java=%LIGHT_JDK_18%/bin/java.exe
SET Memory=2048
SET Port=2002
SET Online=true
SET Max_Player=69
SET Eula=true
SET Level=level

SET Config=Modify/
::-----------------------------------------
:: Flags_High for memory higher 12GB
SET Flags_High=--add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15
:: Flags_Low for memory lower than 12GB
SET Flags_Low=--add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20
::-----------------------------------------

title %Band% %Instance% - %ServerJar% - %Memory%

:: Runtime
%Java% -Xms%Memory%M -Xmx%Memory%M %Flags_Low% -Dcom.mojang.eula.agree=%Eula% -jar %ServerJar%.jar --nogui --port %Port% --online-mode %Online% --max-players %Max_Player% --server-name %Instance% motd= %Instance% --world-dir %Level% --bukkit-settings %Config%bukkit.yml --spigot-settings %Config%spigot.yml --config %Config%server.properties --purpur-settings %Config%purpur.yml --pufferfish-settings %Config%pufferfish.yml --paper-settings %Config%paper.yml
::-----------------------------------------

::misc
color 0c
cls
type stop
echo Server has stop restarting server...
timeout /t 5 > nul
cls
GOTO RESTART
pause