if success(`powershell.exe where.exe choco`) == false
    if chomp(read(`powershell.exe Get-ExecutionPolicy`, String)) == "Restricted"
        if success(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`) == true
            run(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`)
        else
            run(`powershell.exe Set-ExecutionPolicy -Scope CurrentUser Bypass`)
        end
    end
    
    cd(pathof(easyplotting)[1:end-15])
    if success(`powershell.exe ./choco_install_Windows_admin.ps1`) == true
        run(`powershell.exe ./choco_install_Windows_admin.ps1`)
    else
        run(`powershell.exe ./choco_install_Windows_non_admin.ps1`)
    end
end

if success(`powershell.exe where.exe /R C: python3`) == false
    if chomp(read(`powershell.exe Get-ExecutionPolicy`, String)) == "Restricted"
        if success(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`) == true
            run(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`)
        else
            run(`powershell.exe Set-ExecutionPolicy -Scope CurrentUser Bypass`)
        end
    end
    
    cd(pathof(easyplotting)[1:end-15])
    if success(`powershell.exe choco install python3 --confirm`) == true
        run(`powershell.exe choco install python3 --confirm`)
    else
        run(`powershell.exe ./python3_non_admin_install.ps1`)
    end
end

if success(`powershell.exe where.exe /R C: python3`) == true && success(`powershell.exe where.exe /R C: python37`) == false
    if chomp(read(`powershell.exe Get-ExecutionPolicy`, String)) == "Restricted"
        if success(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`) == true
            run(`powershell.exe Set-ExecutionPolicy Bypass -Scope Process`)
        else
            run(`powershell.exe Set-ExecutionPolicy -Scope CurrentUser Bypass`)
        end
    end

    cd(pathof(easyplotting)[1:end-15])
    if success(`powershell.exe choco upgrade python3 --confirm`) == true
        run(`powershell.exe choco upgrade python3 --confirm`)
    else
        run(`powershell.exe ./python3_non_admin_upgrade.ps1`)
    end
end

if success(`powershell.exe where.exe /R C: julia`) == false
    run(`powershell.exe choco install julia --confirm`)
end