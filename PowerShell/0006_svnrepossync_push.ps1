$reposName = 'testrepos'
$remoteBaseDir = 'N:\repos\svn\'

# プッシュを実装
function doPush {
    param(
        $reposName,
        $remoteBaseDir,
        $localReposDir,
        $remoteReposDir
    )
    # リポジトリフォルダのコピーを実行
    robocopy $localReposDir $remoteReposDir /MIR /E /R:1
    
    if ($remoteBaseDir.Substring(1, 1) -eq ':') {
        $remoteReposSvnPath = 'file:///' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    } else {
        $remoteReposSvnPath = 'file:' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    }

    # TortoiseSvnのRepository Browserのショートカットを作成
    $wshShell = New-Object -ComObject WScript.Shell
    $linkPath = Join-Path $remoteBaseDir "$($reposName).lnk"
    $shortcut = $wshShell.CreateShortcut($linkPath)
    $shortcut.TargetPath = "`"C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe`""
    $shortcut.Arguments = "/command:repobrowser /path:`"$($remoteReposSvnPath)`""
    $shortcut.IconLocation = "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe"
    $shortcut.WorkingDirectory = "C:\Program Files\TortoiseSVN\bin"
    $shortcut.Save()
}

# リポジトリのリビジョン番号を調べる
# リポジトリがない場合、リビジョン0を返却
function getReposRevision {
    param(
        $reposDir # リポジトリのディレクトリ
    )
    if (($reposDir -ne $null) -and (Test-Path $reposDir) -eq $True) {
        return [int](Get-Content (Join-Path (Join-Path $reposDir 'db') 'current'))
    } else {
        return [int]0
    }
}


# 同期化したリビジョンを更新
function updateSyncRevision{
    param(
        $newRevision
    )
    Set-Content -Path (Join-Path $PSScriptRoot \..\.svnrepossyncrevision) -Value $newRevision
}

######################################
# ここからメイン処理
######################################

$localReposDir = Resolve-Path (Join-Path $PSScriptRoot \..\.svnrepos)
$remoteReposDir = Join-Path $remoteBaseDir "$($reposName).svnrepos"

# リポジトリのリビジョンを調べる
$localRevision = getReposRevision -reposDir $localReposDir
$remoteRevision = getReposRevision -reposDir $remoteReposDir
if ((Test-Path (Join-Path $PSScriptRoot \..\.svnrepossyncrevision))) {
    $syncRevision = [int](Get-Content (Join-Path $PSScriptROot \..\.svnrepossyncrevision))
} else {
    $syncRevision = [int]0
}
Write-Host "local  : $localRevision"
Write-Host "remote : $remoteRevision"
Write-Host "sync   : $syncRevision"

# 前回同期時からローカルリビジョンが同じ場合、push不要
if ($localRevision -eq $syncRevision) {
    Write-Host '前回同期化時からローカルリポジトリに更新がないため、Pushの必要がありません。'
    exit 0

# 前回同期化時よりもローカルリビジョンが下がった場合、状態が変
} elseif ($localRevision -lt $syncRevision) {
    Write-Host "状態が変です。前回同期化時よりもローカルリポジトリが古くなっています。前回同期化時のリビジョン:$syncRevision、ローカルのリビジョン:$localRevision"
    exit 1

# 前回同期化後にローカルリビジョンが上がった場合、push可能
} else {
    # Write-Host 'Push可能です。'
    
    # 前回同期化時よりもリモートリビジョンが上がっている場合
    if ($syncRevision -lt $remoteRevision) {
        Write-Host 'リモートが最新です。先にPullして下さい。'
        Write-Host '※Pullするとローカルにコミットした内容は失われますので、データを退避するなりして備えて下さい。'
        exit 0

    # 前回同期化時よりもリモートリビジョンが下がっている場合
    } elseif ($syncRevision -gt $remoteRevision) {
        Write-Host "状態が変です。前回同期時よりもリモートリポジトリが古くなっています。前回同期化時のリビジョン:$syncRevision、リモートのリビジョン:$remoteRevision"
        exit 1

    # 前回同期化時とリモートリビジョンが同じ場合
    } else {
        # Write-Host 'Push可能です。'
        
        # プッシュを実行
        doPush -reposName $reposName `
               -remoteBaseDir $remoteBaseDir `
               -localReposDir $localReposDir `
               -remoteReposDir $remoteReposDir

        # 同期化したリビジョンを更新
        updateSyncRevision -newRevision $localRevision
    }
}
