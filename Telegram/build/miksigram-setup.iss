; Miksigram Desktop installer (Inno Setup 6).
; Per-user install without admin rights, like the official Telegram Desktop setup:
; the app lives in %APPDATA%\Miksigram Desktop and keeps its tdata folder there,
; separate from a real Telegram Desktop install.
;
; Build: ISCC /DAppVersion=7.0.9 /DSourceExe=path\Telegram.exe /DOutputDir=out miksigram-setup.iss

#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif
#ifndef SourceExe
  #define SourceExe "..\..\out\Release\Telegram.exe"
#endif
#ifndef OutputDir
  #define OutputDir "."
#endif

#define AppName "Miksigram"
#define AppExe "Miksigram.exe"

[Setup]
AppId={{0ACFA3B1-9294-5C51-B7B7-3417FDF9A069}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher=Miksigram
DefaultDirName={userappdata}\Miksigram Desktop
DisableDirPage=auto
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir={#OutputDir}
OutputBaseFilename=Miksigram-Setup-{#AppVersion}
SetupIconFile=..\Resources\art\icon256.ico
UninstallDisplayIcon={app}\{#AppExe}
UninstallDisplayName={#AppName}
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#SourceExe}"; DestDir: "{app}"; DestName: "{#AppExe}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExe}"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\{#AppExe}"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExe}"; Description: "{cm:LaunchProgram,{#AppName}}"; Flags: nowait postinstall skipifsilent
