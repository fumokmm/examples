# 引数1: クローンしてくるリポジトリ名
function usage {
    Write-Host "Usage: $($Script:MyInvocation.MyCommand.Name) <クローンしてくるリポジトリ名>"
    exit 1
}
if ($args.Count -eq 1) {
    $reposName = $args[0]
} else {
    usage
}

$reposBaseDir = Join-Path $PSScriptRoot $reposName
$remoteBaseDir = 'N:\repos\svn\'
#$remoteBaseDir = '\\192.168.3.5\share\repos\svn\' # サーバ名で指定

# リポジトリディレクトリが既にある場合は処理終了
if (Test-Path $reposBaseDir) {
    Write-Host "$($reposBaseDir)が既に存在します。"
    exit 1
}
# リモートリポジトリが存在しない場合は処理終了
if (-not (Test-Path (Join-Path $remoteBaseDir ($reposName + '.svnrepos')))) {
    Write-Host "$((Join-Path $remoteBaseDir ($reposName + '.svnrepos')))が存在しません。"
    exit 1
}

$svnUrlBaseLocal = 'file:///'
$svnUrlBaseServer = 'file:'
if ($remoteBaseDir -match ':') {
    $svnURLCloneRepos = ($svnUrlBaseLocal + $remoteBaseDir + "$($reposName).svnrepos") -replace '\\', '/'
} else {
    $svnURLCloneRepos = ($svnUrlBaseServer + $remoteBaseDir + '$($reposName).svnrepos') -replace '\\', '/'
}

# フォルダ作成
$reposCoreDir = Join-Path $reposBaseDir '.svnrepos'
$scriptsDir = Join-Path $reposBaseDir 'scripts'
$workingCopyDir = Join-Path $reposBaseDir 'wc'
New-Item -Type Directory -Path $reposCoreDir
New-Item -Type Directory -Path $workingCopyDir

# スクリプトをエクスポートしてくる
svn export "`"$($svnURLCloneRepos)/scripts`"" $scriptsDir

# スクリプトを使ってfetchする
. (Join-Path $scriptsDir 'fetch.ps1')
# .svnrepos_bkは付与のため削除
Remove-Item -Recurse ($reposCoreDir + '_bk')

# チェックアウトする(SVN管理を開始)
$svnURLDefaultPaths = @(
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/trunk`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/tags`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/branches`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/scripts`""
)
svn checkout $svnURLDefaultPaths[0] $workingCopyDir
svn checkout $svnURLDefaultPaths[3] $scriptsDir
