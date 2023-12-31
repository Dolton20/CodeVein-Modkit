SET "ddp=%~dp0" 
SET "ddp=%ddp:~0,-1%" 
 
SET /p editorPath= < Tools\user_settings\editor_directory.txt 
 
del /S CodeVein\*.uasset 
del /S CodeVein\*.ubulk 
del /S CodeVein\*.uexp 
del /S CodeVein\*.umap 
del /S CodeVein\*.ufont 
 
"%editorPath%\UE4Editor-Cmd.exe" "%ddp%\UE4Project\CodeVein.uproject" -run=cook -targetplatform=WindowsNoEditor 
 
robocopy /job:Tools\configs\copy_cooked_assets 
 
robocopy /S Precooked CodeVein 
