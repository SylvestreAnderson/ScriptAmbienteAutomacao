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

## Baixando e instalado o Python 3.8.8
function InstalandoPython {
    if(Test-Path "C:\Users\$usuario\AppData\Local\Programs\Python\Python38"){
        Write-Output "Python 3.8.8 ja instalado na maquina!"
    } else {
        Set-Location "C:\programasAutomacao"

            if(-not (Test-Path "C:\programasAutomacao\Python3.8.8.exe")){
                Write-Output "Baixando o instalador do Python3.8.8.exe Aguarde..."
                Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.8.8/python-3.8.8-amd64.exe" -OutFile "Python3.8.8.exe" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\Python3.8.8.exe"){
                Write-Output "Instalando o Python3.8.8 na maquina Aguarde..."
                Start-Process "C:\programasAutomacao\Python3.8.8.exe" -ArgumentList "/quiet"
                Write-Output "Instalacao do Python3.8.8 concluida"
            }
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
            if(-not (Test-Path "C:\programasAutomacao\node-v18.18.2-x64.msi")){
                Write-Output "Baixando o instalador do NodeJs versao 18.18.2 Aguarde..."
                Invoke-WebRequest -Uri "https://nodejs.org/dist/v18.18.2/node-v18.18.2-x64.msi" -OutFile "node-v18.18.2-x64.msi" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\node-v18.18.2-x64.msi"){
                Write-Output "Instalando o Node.js na maquina Aguarde..."
                $arguments = "/i C:\programasAutomacao\node-v18.18.2-x64.msi /quiet"
                Start-Process msiexec.exe -ArgumentList $arguments -Wait
                Write-Output "Instalacao do Node.js concluida!"
            }
           
        }
    }     
}

#instalando o Java
function InstandoJava {
    if(Test-Path "C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot"){
        Write-Output "Java instalado na maquina!"
    } else {
        Set-Location "C:\programasAutomacao"
        if(-not (Test-Path "C:\programasAutomacao\java8u392")){
            Write-Output "Baixando o Java na versao 1.8.0_392-392 Aguarde..."
            Invoke-WebRequest -Uri "https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u392-b08/openlogic-openjdk-8u392-b08-windows-x64.msi" -OutFile "java1.8.0_392-392.msi" -UseBasicParsing
        } 

        if(Test-Path "C:\programasAutomacao\java1.8.0_392-392.msi"){
            Write-Output "Instalando o java8u392 na maquina Aguarde..."
            $arguments = "/i C:\programasAutomacao\java1.8.0_392-392.msi /quiet"
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
        
            if(-not (Test-Path "C:\programasAutomacao\Git-2.42.0.2-64-bit.exe")){
                Write-Output "Baixando o instalador do Git Aguarde..."
                Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe" -OutFile "Git-2.42.0.2-64-bit.exe" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\Git-2.42.0.2-64-bit.exe"){
                Write-Output "Instalando o Git na maquina Aguarde..."
                $Install = Start-Process 'C:\programasAutomacao\Git-2.42.0.2-64-bit.exe' -ArgumentList '/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"' -Wait -PassThru
                while ($Install.ExitCode -eq $null){Sleep 1}
                Write-Output "Instalacao do Git concluida!"
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
            Invoke-WebRequest -Uri "https://redirector.gvt1.com/edgedl/android/studio/install/2022.3.1.20/android-studio-2022.3.1.20-windows.exe" -OutFile "AndroidStudio.exe" -UseBasicParsing 
        }

        if(Test-Path "C:\programasAutomacao\AndroidStudio.exe"){
            Write-Output "Instalando o Android Studio na maquina Aguarde..."
            $Install = Start-Process "C:\programasAutomacao\AndroidStudio.exe " -ArgumentList "/S" -PassThru
            while ($Install.ExitCode -eq $null){Sleep 1} 
            Write-Output "Instalacao do Android Studio concluido!"
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
    [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\', 'Machine')
    [Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\" + $usuario + "\AppData\Local\Android\Sdk", "Machine")  
    #[Environment]::SetEnvironmentVariable('Path', '%SystemRoot%\system32' + ';%SystemRoot%' + ';%SystemRoot%\System32\Wbem' + ';%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\' + ';%SYSTEMROOT%\System32\OpenSSH\' + ';C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\bin' + ';C:\Program Files\Git\cmd' + ';C:\Program Files\nodejs\', 'Machine')  

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\bin", [EnvironmentVariableTarget]::Machine)

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\Git\cmd", [EnvironmentVariableTarget]::Machine)

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\nodejs\", [EnvironmentVariableTarget]::Machine)


    
        

    #Write-Output "Conigurando as variaveis de ambiente usuario ..."
    #[Environment]::SetEnvironmentVariable("Path", "C:\Users\$usuario\AppData\Local\Programs\Microsoft VS Code\bin" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\Scripts\" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\" + ";%USERPROFILE%\AppData\Local\Microsoft\WindowsApps" +";%JAVA_HOME%\bin" + ";%ANDROID_HOME%\bin" + ";%ANDROID_HOME%\platform-tools" + ";%ANDROID_HOME%\tools" + ";%ANDROID_HOME%\cmdline-tools" + ";C:\Users\$usuario\AppData\Local\Android\Sdk" + ";C:\Users\$usuario\AppData\Roaming\npm" + ";C:\Program Files\nodejs", [System.EnvironmentVariableTarget]::User)



    #========================================================================================= todo
    #Write-Output "Conigurando as variaveis de ambiente sistema ..."
    #[Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\', 'Machine')
    #[Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\" + $usuario + "\AppData\Local\Android\Sdk", "Machine")  
    
    #$vairavel_ambiente = (";C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\bin",";C:\Program Files\Git\cmd", ";C:\Program Files\nodejs\")

    #foreach ($ambiente in $vairavel_ambiente ) {
    #    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + $ambiente,
    #    [EnvironmentVariableTarget]::Machine)
    #    Write-Output "Configurando a variavel de ambiente " + $ambiente
    #}
     
    Write-Output "Conigurando as variaveis de ambiente usuario ..."
    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\Scripts\", [EnvironmentVariableTarget]::User)   

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";%JAVA_HOME%\bin", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";%ANDROID_HOME%\bin", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";%ANDROID_HOME%\platform-tools", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";%ANDROID_HOME%\tools", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";%ANDROID_HOME%\cmdline-tools", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Users\$usuario\AppData\Local\Android\Sdk", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Users\$usuario\AppData\Roaming\npm", [EnvironmentVariableTarget]::User) 

    [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\nodejs", [EnvironmentVariableTarget]::User)

    #[Environment]::SetEnvironmentVariable("Path", "C:\Users\$usuario\AppData\Local\Programs\Microsoft VS Code\bin" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\Scripts\" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\" + ";%USERPROFILE%\AppData\Local\Microsoft\WindowsApps" +";%JAVA_HOME%\bin" + ";%ANDROID_HOME%\bin" + ";%ANDROID_HOME%\platform-tools" + ";%ANDROID_HOME%\tools" + ";%ANDROID_HOME%\cmdline-tools" + ";C:\Users\$usuario\AppData\Local\Android\Sdk" + ";C:\Users\$usuario\AppData\Roaming\npm" + ";C:\Program Files\nodejs", [System.EnvironmentVariableTarget]::User)
       
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

function instalandoPacotesRobot {

    if(Test-Path "C:\Users\$usuario\AppData\Local\Programs\Python\Python38"){
        Write-Output "Atualizando a versão do Pip na maquina Aguarde..."
        python.exe -m pip install --upgrade pip

        Write-Output "Instalando os pacotes do Robot Aguarde..."
        #pip install -r requirements.txt
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
    Write-Output "Removendo a pasta ProgramasAutomacao"
    Write-Output "Removendo os arquivos desnecessarios Aguarde..."
    Set-Location "C:\"
    Remove-Item -Path C:\ProgramasAutomacao -Force -Recurse 
    
    Write-Output "Instalacao do Ambiente de Automacao concluido!"
    
}


#=========================================================================
#CriandoPastaInstalacao
#InstalandoPython
#IntalarNodeJs
#InstandoJava
#InstallGit
#instalandoAndroidStudio
setVariaviesSistema
#atualizaTerminalEmExecucao
#instalandoAppium
#installAppiumInstpector
#instalandoPacotesRobot
#atualizaTerminalEmExecucao
#limpandoAmbiente