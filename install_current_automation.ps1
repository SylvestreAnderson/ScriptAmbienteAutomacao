#Obtendo o Usuário Logado na maquina
$usuario = [System.Environment]::UserName

Write-Output "Instalando os programas para o usuario logado " $usuario

## Criando uma pasta temporaria
function CriandoPastaInstalacao {
    if(Test-Path -Path "C:\programasAutomacao"){
        Write-Output "Pasta ProgramasAutomacao Existente!"
    } else {
        mkdir "C:\ProgramasAutomacao"
        Write-Output "Pasta ProgramasAutomacao Criada com sucesso!"
    }         
} 

function CriandoPastaProjetos {
    if(Test-Path -Path "C:\projetos"){
        Write-Output "Pasta Projetos Existente!"
    } else {
        mkdir "C:\Projetos"
        Write-Output "Pasta Projetos Criada com sucesso!"
    }         
}

## intalando o node
function IntalarNodeJs {
    if(Test-Path -Path "C:\Program Files\nodejs"){
        Write-Output "Nodejs ja instalado na maquina!"
    } else {
        Set-Location "C:\programasAutomacao"
        sleep (3)
        if(Test-Path -Path "C:\programasAutomacao"){
            if(-not (Test-Path "C:\programasAutomacao\node-v20.16.0-x64.msi")){
                Write-Output "Baixando o instalador do NodeJs versao 20.16.0 Aguarde..."
                Invoke-WebRequest -Uri "https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi" -OutFile "node-v20.16.0-x64.msi" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\node-v20.16.0-x64.msi"){
                Write-Output "Instalando o Node.js na maquina Aguarde..."
                $arguments = "/i C:\programasAutomacao\node-v20.16.0-x64.msi /quiet"
                Start-Process msiexec.exe -ArgumentList $arguments -Wait
                Write-Output "Instalacao do Node.js concluida!"
            }
           
        }
    }     
}

## Baixando e instalado o Python 
function InstalandoPython {
    if(Test-Path "C:\Users\$usuario\AppData\Local\Programs\Python"){
        Write-Output "Python ja instalado na maquina!"
    } else {
        Set-Location "C:\programasAutomacao"

            if(-not (Test-Path "C:\ProgramasAutomacao\arquivos\python-3.12.6-amd64.exe")){
                Write-Output "Baixando o instalador do python-3.12.6 Aguarde..."
                git clone https://github.com/SylvestreAnderson/arquivos.git
            }
    
            if(Test-Path "C:\ProgramasAutomacao\arquivos\python-3.12.6-amd64.exe"){
                Write-Output "Instalando o python-3.12.6 na maquina Aguarde..."
                Start-Process "C:\ProgramasAutomacao\arquivos\python-3.12.6-amd64.exe" "/quiet Include_pip=1 PrependPath=1 "
                Write-Output "Instalacao do python-33.12.6 concluida"
            }
    }  
}


#instalando o Java
function InstandoJava {
    if(Test-Path "C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot"){
        Write-Output "Java na versao jdk-21.0.4.7 instalado!"
    } else {
        Set-Location "C:\programasAutomacao"
        if(-not (Test-Path "C:\programasAutomacao\microsoft-jdk-21.0.4-windows-x64.msi")){
            Write-Output "Baixando o Java na versao jdk-21.0.4 Aguarde..."
            Invoke-WebRequest -Uri "https://aka.ms/download-jdk/microsoft-jdk-21.0.4-windows-x64.msi" -OutFile "microsoft-jdk-21.0.4-windows-x64.msi" -UseBasicParsing
        } 

        if(Test-Path "C:\programasAutomacao\microsoft-jdk-21.0.4-windows-x64.msi"){
            Write-Output "Instalando o Java na versao jdk-21.0.4.7 na maquina Aguarde..."
            $arguments = "/i C:\programasAutomacao\microsoft-jdk-21.0.4-windows-x64.msi /quiet"
            Start-Process msiexec.exe -ArgumentList $arguments -Wait
            Write-Output "Instalacao do Java concluida!"
        }
    }   
}


#Instalando o Git
function InstallGit {
    if(Test-Path -Path "C:\Program Files\Git"){
        Write-Output "Git ja instalado na maquina!"
    } else {
        Set-Location "C:\programasAutomacao"
        if(Test-Path -Path "C:\programasAutomacao"){
            if(-not (Test-Path "C:\programasAutomacao\Git-2.46.2-64-bit.exe")){
                Write-Output "Baixando o instalador do Git Aguarde..."
                Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.46.2.windows.1/Git-2.46.2-64-bit.exe" -OutFile "Git-2.46.2-64-bit.exe" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\Git-2.46.2-64-bit.exe"){
                Write-Output "Instalando o Git na maquina Aguarde..."
                Start-Process "C:\programasAutomacao\Git-2.46.2-64-bit.exe" -ArgumentList "/quiet"
                Write-Output "Instalacao do Git concluida!"
            }
           
        }
    } 
    
}

# Instalação do Android Studio
function instalandoAndroidStudio {
    if(Test-Path "C:\Program Files\Android"){
        Write-Output "Android Studio ja esta instalado!"
    } else {
        Set-Location "C:\programasAutomacao"

        if(-not (Test-Path "C:\programasAutomacao\AndroidStudio")){
            Write-Output "Baixando o Android Studio Aguarde..."
            Invoke-WebRequest -Uri "https://redirector.gvt1.com/edgedl/android/studio/install/2024.1.1.12/android-studio-2024.1.1.12-windows.exe" -OutFile "AndroidStudio.exe" -UseBasicParsing 
        }

        if(Test-Path "C:\programasAutomacao\AndroidStudio.exe"){
            Write-Output "Instalando o Android Studio na maquina Aguarde..."
            $Install = Start-Process "C:\programasAutomacao\AndroidStudio.exe " -ArgumentList "/S" -PassThru
            while ($Install.ExitCode -eq $null){Sleep 1} 
            Write-Output "Instalacao do Android Studio concluido!"
        }
    }
    
}

function instalarMicrosoftVisualC++ {

    if(Test-Path "C:\Users\$usuario\AppData\Local\Microsoft\VisualStudio")
    {
        Write-Output "Microsoft Visual C++ ja esta instalado!"
    } else {    
        Set-Location "C:\programasAutomacao"
        
        Write-Output "Baixando o Microsoft Visual C++..."
            Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "vc_redist.x64.exe" -UseBasicParsing 

        if(Test-Path "C:\programasAutomacao\vc_redist.x64.exe"){
            Write-Output "Instalando o Microsoft Visual C++ na maquina Aguarde..."
                $Install = Start-Process "C:\programasAutomacao\vc_redist.x64.exe" -ArgumentList "/S" -PassThru
            while ($Install.ExitCode -eq $null){Sleep 1} 
                Write-Output "Instalacao do Microsoft Visual C++ concluido!"
    }   
         
}        
        
    
}

function installAppiumInstpector {
        if(Test-Path "C:\Users\$usuario\AppData\Local\Programs\Appium Inspector"){
        Write-Output "Appium Inspector ja esta instalado!"
    } else {
        Set-Location "C:\programasAutomacao"

        if(-not (Test-Path "C:\programasAutomacao\Appium-Inspector-windows-2023.11.1.exe")){
            Write-Output "Baixando o Appium Inspector Aguarde..."
            Invoke-WebRequest -Uri "https://github.com/appium/appium-inspector/releases/download/v2023.11.1/Appium-Inspector-windows-2023.11.1.exe" -OutFile "Appium-Inspector-windows-2023.11.1.exe" -UseBasicParsing 
        }

        if(Test-Path "C:\programasAutomacao\Appium-Inspector-windows-2023.11.1.exe"){
            Write-Output "Instalando o Appium Inspector na maquina Aguarde..."
            $Install = Start-Process "C:\programasAutomacao\Appium-Inspector-windows-2023.11.1.exe" -ArgumentList "/S" -PassThru
            while ($Install.ExitCode -eq $null){Sleep 1} 
            Write-Output "Instalacao do Appium Inspector concluido!"
        }
    }
        
}

#Setando as variaveis de ambiente

function setVariaviesSistema  {
    Write-Output "Conigurando as variaveis de ambiente sistema ..."
    [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot', 'Machine')
    if(Test-Path "C:\Program Files\Android"){
        [Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\" + $usuario + "\AppData\Local\Android\Sdk", "Machine")
    }
    
    $valida_Variavel_Path_Global = [Environment]::GetEnvironmentVariable("Path", "Machine")

    $validaVariavelStringGlobal = $valida_Variavel_Path_Global -split ";"

    $variablesGlobal = @('C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot\bin', 'C:\Program Files\Git\cmd','C:\Program Files\nodejs\')


    for(($x = 0); $x -le 2; $x++)
    {
        if(-not ($validaVariavelStringGlobal -contains "$variablesGlobal[$x]")){
            [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";$variablesGlobal[$x]", [EnvironmentVariableTarget]::Machine)
        }
    }


    #if(-not ($validaVariavelStringGlobal -contains "C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot\bin")){
       # [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot\bin", [EnvironmentVariableTarget]::Machine)
    #}

    #if(-not ($validaVariavelStringGlobal -contains "C:\Program Files\Git\cmd")){
      #  [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\Git\cmd", [EnvironmentVariableTarget]::Machine)
    #}
    
    #if(-not ($validaVariavelStringGlobal -contains "C:\Program Files\nodejs\")){
     #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\nodejs\", [EnvironmentVariableTarget]::Machine)
    #}

    
    
    Write-Output "Conigurando as variaveis de ambiente usuario ..."

    $valida_Variavel_Path_User = [Environment]::GetEnvironmentVariable("Path", "User")

    $validaVariavelString = $Valida_Variavel_Path_User -split ";"

    $variablesUser = @(
        '%JAVA_HOME%\bin',
        'C:\Users\$usuario\AppData\Roaming\npm',
        'C:\Program Files\nodejs'
    )

    for(($x = 0); $x -le 2; $x++)
    {
        if (-not ($validaVariavelString -contains "$variablesUser[$x]")){
            [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";$variablesUser[$x]", [EnvironmentVariableTarget]::User)
        }
    }

    #if (-not ($validaVariavelString -contains "%JAVA_HOME%\bin")){
     #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";%JAVA_HOME%\bin", [EnvironmentVariableTarget]::User)
    #}

    if(Test-Path "C:\Program Files\Android"){

        $variablesUserAndroid = @(
           '%ANDROID_HOME%\platform-tools',
           '%ANDROID_HOME%\tools',
           '%ANDROID_HOME%\build-tools',
           '%ANDROID_HOME%\cmdline-tools',
           '%ANDROID_HOME%\emulator',
           'C:\Users\$usuario\AppData\Local\Android\Sdk' 
        )

        for(($x = 0); $x -le 4; $x++)
        {
            if(-not($validaVariavelString -contains "$variablesUserAndroid[$x]")){
                [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";$variablesUserAndroid[$x]", [EnvironmentVariableTarget]::User)
            }  
        }

        #if(-not($validaVariavelString -contains "%ANDROID_HOME%\platform-tools")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";%ANDROID_HOME%\platform-tools", [EnvironmentVariableTarget]::User)
        #}    
        
        #if(-not ($validaVariavelString -contains "%ANDROID_HOME%\tools")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + "%ANDROID_HOME%\tools", [EnvironmentVariableTarget]::User)
        #}
        
        #if (-not ($validaVariavelString -contains "%ANDROID_HOME%\build-tools")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";%ANDROID_HOME%\build-tools", [EnvironmentVariableTarget]::User)
        #}
    
        #if (-not ($validaVariavelString -contains "%ANDROID_HOME%\cmdline-tools")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";%ANDROID_HOME%\cmdline-tools", [EnvironmentVariableTarget]::User)
        #}
    
        #if (-not ($validaVariavelString -contains "%ANDROID_HOME%\emulator")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";%ANDROID_HOME%\emulator", [EnvironmentVariableTarget]::User)
        #}

        #if(-not ($validaVariavelString -contains "C:\Users\$usuario\AppData\Local\Android\Sdk")){
         #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";C:\Users\$usuario\AppData\Local\Android\Sdk", [EnvironmentVariableTarget]::User)
        #}
    }
    

    #if(-not ($validaVariavelString -contains "C:\Users\$usuario\AppData\Roaming\npm")){
      #  [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";C:\Users\$usuario\AppData\Roaming\npm", [EnvironmentVariableTarget]::User)
    #}
    
    #if(-not ($validaVariavelString -contains "C:\Program Files\nodejs")){
     #   [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";C:\Program Files\nodejs", [EnvironmentVariableTarget]::User)
    #}  
           
}

# instalando Appium
function instalandoAppium {  
    
    if(Test-Path -Path "C:\Program Files\nodejs"){
        Write-Output "Instalando o Appium na maquina Aguarde..."
        npm install -g appium@1.22.3
        npm i appium-doctor -g
    } else {
        Write-Output "Node nao instalado na maquina!"
    }
}



function BaixandooProjeto {
    if(-not(Test-Path "C:\projetos\cnmb-qa-automacao")){
        Set-Location "C:\projetos"
        git clone https://banco-bmg@dev.azure.com/banco-bmg/cnmb/_git/cnmb-qa-automacao
    }    
   
    
}

function ConfigBrowserStack {
    if(-not(Test-Path "C:\projetos\cnmb-qa-automacao\android\resources\variables.robot") -Or (-not(Test-Path "C:\projetos\cnmb-qa-automacao\ios\resources\variables.robot"))) {
        $UserName = Read-Host "Por favor entre com UserName do Browser Stack"
        $AccessKey = Read-Host "Por favor entre com o Access Key do Browser Stack"
        
        if(-not(Test-Path "C:\projetos\cnmb-qa-automacao\android\resources\variables.robot")){
            Write-Output "Configurando o Browser Stack no projeto"            
            Set-Location "C:\projetos\cnmb-qa-automacao\android\resources"
            New-Item -Path . -Name "variables.robot" -ItemType "file" -Value "*** Variables ***`n`${PLATFORM}`                           bs        ###DETERMINA EM QUAL AMBIENTE RODAR OS TESTES (local, bs)`n`${LOCAL_URL}`                          http://0.0.0.0:4723/wd/hub`n`${PLATFORM_VERSION}`                   %{PLATFORM_VERSION=13.0}`n`${USERNAME_BS}`                        $UserName`n`${ACCESS_KEY_BS}`                      $AccessKey
            " 
        } else {
            Write-Output "Arquivo variable.robot ja existe na pasta do Android!"
        }

        if(-not(Test-Path "C:\projetos\cnmb-qa-automacao\ios\resources\variables.robot")){
            Write-Output "Configurando o Browser Stack no projeto"            
            Set-Location "C:\projetos\cnmb-qa-automacao\ios\resources"

            New-Item -Path . -Name "variables.robot" -ItemType "file" -Value "*** Variables ***`n`${PLATFORM}`                           bs        ###DETERMINA EM QUAL AMBIENTE RODAR OS TESTES (local, bs)`n`${LOCAL_URL}`                          http://0.0.0.0:4723/wd/hub`n`${PLATFORM_VERSION}`                   %{PLATFORM_VERSION=13.0}`n`${USERNAME_BS}`                        $UserName`n`${ACCESS_KEY_BS}`                      $AccessKey`n`${UDID}`                               UDID`n`${DEVICE_NAME}`                        DEVICE_NAME
            " 
        } else {
            Write-Output "Arquivo variable.robot ja existe na pasta do IOS!"
        }
    }   
}

#instalando os pacotes Robot
function instalandoPacotesRobot {

    if(Test-Path "C:\Users\$usuario\AppData\Local\Programs\Python"){
        Write-Output "Atualizando a versao do Pip na maquina Aguarde..."
        python.exe -m pip install --upgrade pip

        Write-Output "Instalando os pacotes do Robot Aguarde..."
        if(Test-Path "C:\projetos\cnmb-qa-automacao"){
            Set-Location "C:\projetos\cnmb-qa-automacao" 
            pip install -r Requirements.txt
        }        
        pip install robotframework
        pip install robotframework-seleniumlibrary
        pip install robotframework-requests

        Write-Output "Atualizando as bibliotecas do Robot Aguarde..."
        pip install --upgrade robotframework-seleniumlibrary
        pip install --upgrade robotframework-appiumlibrary
        pip install --upgrade robotframework-requests
    } else {
        Write-Output "Python nao instalado na Maquina"
    }
    
}

function atualizaTerminalEmExecucao {
    Write-Output "Atualizando o terminal!"
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}


function limpandoAmbiente {
    sleep (3)
    if(Test-Path -Path "C:\programasAutomacao"){
        Write-Output "Removendo a pasta ProgramasAutomacao"
        Write-Output "Removendo os arquivos desnecessarios Aguarde..."
        Set-Location "C:\"
        Remove-Item -Path C:\ProgramasAutomacao -Force -Recurse 
    
        Write-Output "Instalacao do Ambiente de Automacao concluido!"
    }
    
    
}


#=========================================================================
# Verificar se o Usuário é administrador da maquina

$validarUsuario = [System.Security.Principal.WindowsIdentity]::GetCurrent().groups -match "S-1-5-32-544"
 
if ($validarUsuario){
    Write-Output 'Iniciando a instalacao Aguarde...'
    limpandoAmbiente
    CriandoPastaInstalacao
    CriandoPastaProjetos    
    IntalarNodeJs
    InstalandoPython
    InstandoJava
    InstallGit
    BaixandooProjeto
    #instalandoAndroidStudio
    setVariaviesSistema
    atualizaTerminalEmExecucao
    instalandoAppium
    installAppiumInstpector
    atualizaTerminalEmExecucao
    instalandoPacotesRobot
    instalarMicrosoftVisualC++
    ConfigBrowserStack
    atualizaTerminalEmExecucao
    limpandoAmbiente
} else {
    Write-Output 'Usuario nao esta com permissao de adm, por favor procure o suporte!'
}

