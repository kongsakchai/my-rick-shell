$command = $args[0]
$arg1 = $args[1]

function Go ($path) {

    if ($path -eq $null) {
        Write-Host "Wubba Lubba Dub Dub!"
        SET-LOCATION "YOURPATH"
    }
    else {
        $path = SpecialsPath($path)

        if ($path -ne $null) {
            Write-Host "Wubba Lubba Dub Dub!"
            SET-LOCATION $path
        }
        else {
            Write-Host "Morty, you idiot! That directory doesn't exist!"
        }
    }
}

function Open ($path) {
    if ($path -eq "") {
        Write-Host "Wubba Lubba Dub Dub!"
        Invoke-Item .
    }
    else {
        $path = SpecialsPath($path)

        if ($path -ne $null) {
            Write-Host "Morty, it's time to get schwifty!"
            Invoke-Item $path
        }
        else {
            Write-Host "Morty, you idiot! That directory doesn't exist!"
        }
    }
}

function Vite ($path) {
    if ($path -eq "") {
        Write-Host "Morty, Vite is the future!"
        npm create vite
    }
    else {
        $path = SpecialsPath($path)

        if ($path -ne $null) {
            Write-Host "Wubba Lubba Dub Dub!"
            SET-LOCATION $path
            npm create vite
        }
        else {
            Write-Host "Morty, you idiot! That directory doesn't exist!"
        }
    }
}

function SpecialsPath ($path) {
    if ($path -eq "pr") {
        $path = "YOURPATH\projects"
    } elseif ($path -eq "lb") {
        $path = "YOURPATH\labs"
    } else {
        $path = "YOURPATH\$path";
    }

    $check = Test-Path $path
    
    if($check -eq $true) {
        return $path
    } else {
        return $null
    }
}

if ($command -eq "go") {
    Go $arg1
} elseif ($command -eq "open") {
    Open $arg1
} elseif ($command -eq "vite") {
    Vite $arg1
} elseif ($command -eq $null) {
    Write-Host "I'm Pickle Rick!"
} else {
    $path = SpecialsPath($command)

    if ($path -ne $null) {
        Write-Host "Wubba Lubba Dub Dub!"
        SET-LOCATION "YOURPATH\$path"
    }
    else {
        Write-Host "Morty, you idiot! That command doesn't exist!"
    }
}