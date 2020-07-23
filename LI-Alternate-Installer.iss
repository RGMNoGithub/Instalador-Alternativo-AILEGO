; LEGO Island Alternate Installer
; Created 2012-2014 Triangle717
; <http://Triangle717.WordPress.com/>
; Contains source code from Grim Fandango Setup
; Copyright (c) 2007-2008 Bgbennyboy
; <http://quick.mixnmojo.com/>

; If any version below the specified version is used for compiling, 
; this error will be shown.
#if VER < EncodeVer(5, 5, 2)
  #error You must use Inno Setup 5.5.2 or newer to compile this script
#endif

#define MyAppInstallerName "Instalador Alternativo - A Ilha LEGOÂ®"
#define MyAppInstallerVersion "1.1.0"
#define MyAppName "A Ilha LEGOÂ®"
#define MyAppNameNoR "A Ilha LEGOÂ®"
#define MyAppVersion "1.1.0.0"
#define MyAppPublisher "LEGO"
#define MyAppExeName "LEGOISLE.EXE"

[Setup]
AppID={#MyAppName}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppInstallerVersion}
AppPublisher={#MyAppPublisher}
AppCopyright=Â© 1997 {#MyAppPublisher}
LicenseFile=license.txt
; Start menu/screen and Desktop shortcuts
DefaultDirName={pf}\{#MyAppNameNoR}
DefaultGroupName={#MyAppNameNoR}
AllowNoIcons=yes
; Installer Graphics
SetupIconFile=ISLE.ico
WizardImageFile=Sidebar.bmp
WizardSmallImageFile=Small-Image.bmp
WizardImageStretch=True
WizardImageBackColor=clBlack
; Location of the compiled Exe
OutputDir=bin
OutputBaseFilename=Instalador Alternativo - {#MyAppNameNoR} {#MyAppInstallerVersion}
; Uninstallation stuff
UninstallFilesDir={app}
UninstallDisplayIcon=ISLE.ico
CreateUninstallRegKey=yes
UninstallDisplayName={#MyAppName}
; This is required so Inno can correctly report the installation size.
UninstallDisplaySize=546308096
; Compression
Compression=lzma2/ultra64
SolidCompression=True
InternalCompressLevel=ultra
LZMAUseSeparateProcess=yes
; From top to bottom:
; Explicitly set Admin rights, no other languages, do not restart upon finish.
PrivilegesRequired=admin
ShowLanguageDialog=no
RestartIfNeededByRun=no

[Languages]
Name: "Portugues"; MessagesFile: "compiler:Default.isl"

[Messages]
Portugues.BeveledLabel={#MyAppInstallerName}
; WelcomeLabel2 is overridden because I'm unsure if every LEGO Island
; disc says version 1.1.0.0 or just mine.
Portugues.WelcomeLabel2=Iremos instalar [name] no seu computador.%n%nÉ recomendável que você feche todos os outros aplicativos antes de continuar.
; DiskSpaceMBLabel is overridden because it reports an incorrect installation size.
Portugues.DiskSpaceMBLabel=

; Both Types and Components sections are required to create the installation options.               
[Types]
Name: "Normal"; Description: "Instalação normal (requer CD)"
Name: "Completa"; Description: "Instalação completa (não requer CD)"  

[Components]
Name: "Normal"; Description: "Instalação normal (requer CD)"; Types: Normal
Name: "Completa"; Description: "Instalação completa (não requer CD)"; Types: Completa 

[Files]
; Manual, icon, license
Source: "US Manual.pdf"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist
Source: "ISLE.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "license.txt"; DestDir: "{app}"; Flags: ignoreversion

; Standard files
Source: "{code:GetSourceDrive}redist\directx\d3drm.dll"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa Normal
Source: "{code:GetSourceDrive}README.HLP"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa Normal
Source: "{code:GetSourceDrive}DATA\disk\*"; DestDir: "{app}"; Flags: external ignoreversion createallsubdirs recursesubdirs; Components: Normal
Source: "{code:GetSourceDrive}MSREG\MSRUN.EXE"; DestName: "Msrun.exe"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa Normal
Source: "{code:GetSourceDrive}MSREG\MSREG.INI"; DestName: "Msreg.ini"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa Normal
Source: "{code:GetSourceDrive}MSREG\MSREG32.DLL"; DestName: "Msreg32.dll"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa Normal
Source: "{code:GetSourceDrive}DATA\disk\CMS16.DLL"; DestName: "CMS16.dll"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist; Components: Completa Normal
Source: "{code:GetSourceDrive}DATA\disk\cms32_95.dll"; DestName: "cms32_95.dll"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist; Components: Completa Normal
Source: "{code:GetSourceDrive}DATA\disk\CMS32_NT.dll"; DestName: "CMS32_NT.dll"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist; Components: Completa Normal

; Because of the disc layout, the Full installation files have to be declared
; separately to ensure everything is installed in their proper location.
Source: "{code:GetSourceDrive}DATA\disk\LEGOISLE.EXE"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\ISLE.EXE"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\CONFIG.EXE"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\LEGO1.DLL"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\MFC42.DLL"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\MSVCRT.DLL"; DestDir: "{app}"; Flags: external ignoreversion; Components: Completa
Source: "{code:GetSourceDrive}Lego\Scripts\*"; DestDir: "{app}\LEGO\Scripts"; Flags: external ignoreversion recursesubdirs createallsubdirs; Components: Completa
Source: "{code:GetSourceDrive}DATA\disk\LEGO\data\*"; DestDir: "{app}\LEGO\data"; Flags: external ignoreversion; Components: Completa


[Icons]
; Start menu/screen and Desktop icons
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\ISLE.ico";Comment: "Run {#MyAppName}"
Name: "{group}\To Configure {#MyAppName}"; Filename: "{app}\CONFIG.EXE"; IconFilename: "{app}\ISLE.ico"; Comment: "Configure {#MyAppName}"
Name: "{group}\Print Free Map of {#MyAppNameNoR}"; Filename: "{app}\Msrun.exe"; IconFilename: "{app}\ISLE.ico"; Comment: "Print A Free Map of {#MyAppNameNoR}"; Parameters: "LaunchRegistration"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\ISLE.ico";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\ISLE.ico"; Comment: "Run {#MyAppName}"; Tasks: desktopicon

[Tasks]
; Create a desktop icon, run with administrator rights
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "Admin"; Description: "Run {#MyAppName} with Administrator Rights"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Registry]
; Registry strings are always hard-coded (!No ISPP functions!) 
; to ensure everything works properly.
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape"; ValueType: none; Flags: uninsdeletekey
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: none; Flags: uninsdeletekey
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "3D Device Name"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "3DSound"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Back Buffers in Video RAM"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "diskpath"; ValueData: "{app}"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Display Bit Depth"; ValueData: "16"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "moviespath"; ValueData: "{app}"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Draw Cursor"; ValueData: "NO"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Flip Surfaces"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Full Screen"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Island Quality"; ValueData: "2"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Island Texture"; ValueData: "1"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "JoystickIndex"; ValueData: "-1"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Music"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "savepath"; ValueData: "{app}"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "UseJoystick"; ValueData: "NO"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Mindscape\LEGO Island"; ValueType: string; ValueName: "Wide View Angle"; ValueData: "YES"; Flags: uninsdeletevalue
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\LEGOISLE.exe"; ValueType: string; ValueName: "(Default)"; ValueData: "{app}\LEGOISLE.EXE"; Flags: uninsdeletekey

; Run with administrator rights if that option was selected
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\LEGOISLE.EXE"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\ISLE.EXE"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\CONFIG.EXE"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\Msrun.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin

[Code]
// Pascal script from Bgbennyboy to pull files off a CD, greatly trimmed up 
// and modified to support ANSI and Unicode Inno Setup by Triangle717.
var
	SourceDrive: string;

#include "FindDisc.pas"

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

procedure InitializeWizard();
begin
	SourceDrive:=GetSourceCdDrive();
end;
