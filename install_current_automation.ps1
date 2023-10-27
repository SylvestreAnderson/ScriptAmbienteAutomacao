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
        if(Test-Path -Path "C:\programasAutomacao"){
            if(-not (Test-Path "C:\programasAutomacao\node-v18.18.2-x64.msi")){
                Write-Output "Baixando o instalador do NodeJs versao 18.18.2 Aguarde..."
                Invoke-WebRequest -Uri "https://nodejs.org/dist/v18.18.2/node-v18.18.2-x64.msi" -OutFile "node-v18.18.2-x64.msi" -UseBasicParsing
            }
    
            if(Test-Path "C:\programasAutomacao\node-v18.18.2-x64.msi"){
                Write-Output "Instalando o Node.js na maquina Aguarde..."
                Start-Process msiexec "/i C:\programasAutomacao\node-v18.18.2-x64.msi /qn" -Wait
                $arguments = "/i C:\programasAutomacao\Nodejs.msi /quiet"
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
            Start-Process "C:\programasAutomacao\java1.8.0_392-392.msi" -ArgumentList "/quiet"
            $arguments = "/i C:\programasAutomacao\java1.8.0_392-392.msi /quiet"
            Start-Process msiexec.exe -ArgumentList $arguments -Wait
            Write-Output "Instalacao do Java concluida!"
        }
    }   
}

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

#Setando as variaveis de ambiente

function setVariaviesSistema  {
    Write-Output "Conigurando as variaveis de ambiente sistema ..."
    [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\OpenLogic\jdk-8.0.392.08-hotspot\', 'Machine')
    [Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\" + $usuario + "\AppData\Local\Android\Sdk", "Machine")  
    [Environment]::SetEnvironmentVariable('Path', '%SystemRoot%\system32' + ';%SystemRoot%' + ';%SystemRoot%\System32\Wbem' + ';%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\' + ';%SYSTEMROOT%\System32\OpenSSH\' + ';C:\Program Files\Git\cmd' + ';C:\Program Files\nodejs\', 'Machine')  
        

    Write-Output "Conigurando as variaveis de ambiente usuario ..."
    [Environment]::SetEnvironmentVariable("Path", "C:\Users\$usuario\AppData\Local\Programs\Microsoft VS Code\bin" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38" + ";C:\Users\$usuario\AppData\Local\Programs\Python\Python38\Script" + ";%USERPROFILE%\AppData\Local\Microsoft\WindowsApps" +";%JAVA_HOME%\bin" + ";%ANDROID_HOME%\bin" + ";%ANDROID_HOME%\platform-tools" + ";%ANDROID_HOME%\tools" + ";%ANDROID_HOME%\cmdline-tools" + ";C:\Users\$usuario\AppData\Local\Android\Sdk" + ";C:\Users\$usuario\AppData\Roaming\npm" + ";C:\Program Files\nodejs", [System.EnvironmentVariableTarget]::User)
}

# instalando Appium
function instalandoAppium {
       

    if( -not (Test-Path "C:\ProgramasAutomacao\installAppium.bat")){
        Write-Output "Instalando o Appium na versao 1.22.3 Aguarde..."
        Set-Location "C:\programasAutomacao"
        ni -n installAppium.bat -v 'npm install -g appium@1.22.3' 
        Sleep(2)
    } else {
        Write-Output "Arquivo installAppium.bat existente! "
    }
    
    if(-not (Test-Path "C:\ProgramasAutomacao\installRequirements.bat")){
        Write-Output "Instalando o Requirements Aguarde..."
        Set-Location "C:\programasAutomacao"
        ni -n installRequirements.bat -v 'pip install -r requirements.txt' 
        Sleep(2)
    } else {
        Write-Output "Arquivo installRequirements.bat existente! "
    }
}



#=========================================================================
CriandoPastaInstalacao
InstalandoPython
IntalarNodeJs
InstandoJava
instalandoAndroidStudio
instalandoAppium
#setVariaviesSistema