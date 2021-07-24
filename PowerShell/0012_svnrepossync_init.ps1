# 引数1: リポジトリ名
$reposName = $args[0]
$reposBaseDir = Join-Path $PSScriptRoot $reposName
$remoteBaseDir = 'N:\repos\svn\'
#$remoteBaseDir = '\\192.168.3.5\share\repos\svn\' # サーバ名で指定

# リポジトリディレクトリが既にある場合は処理終了
if (Test-Path $reposBaseDir) {
    Write-Host "$($reposBaseDir)が既に存在します。"
    exit -1
}

# フォルダ作成
$reposCoreDir = Join-Path $reposBaseDir '.svnrepos'
$scriptsDir = Join-Path $reposBaseDir 'scripts'
$workingCopyDir = Join-Path $reposBaseDir 'wc'
New-Item -Type Directory -Path $reposCoreDir
New-Item -Type Directory -Path $scriptsDir
New-Item -Type Directory -Path $workingCopyDir

# SVNリポジトリを新規作成
svnadmin create $reposCoreDir
# デフォルト構成を作成
$svnUrlBaseLocal = 'file:///'
$svnUrlBaseServer = 'file:'

$svnURLDefaultPaths = @(
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/trunk`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/tags`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/branches`"",
    "`"$($svnUrlBaseLocal)$($reposCoreDir -replace '\\', '/')/scripts`""
)
svn mkdir $svnURLDefaultPaths -m "initial commit."

# テンプレートリポジトリからスクリプトファイルをエクスポートしコミット
if ($remoteBaseDir -match ':') {
    $svnURLtemplate = ($svnUrlBaseLocal + $remoteBaseDir + 'svnrepossync_template.svnrepos') -replace '\\', '/'
} else {
    $svnURLtemplate = ($svnUrlBaseServer + $remoteBaseDir + 'svnrepossync_template.svnrepos') -replace '\\', '/'
}
$tmpDir = Join-Path $PSScriptRoot "tmp_$((Get-Date).ToString('yyyyMMddHHmmss'))"
svn export "`"$($svnURLtemplate)/trunk/scripts`"" $tmpDir
# エクスポートしたスクリプト内の $reposName変数の値を置換
foreach ($pp in '0006_svnrepossync_push.ps1', '0007_svnrepossync_fetch.ps1') {
    $contents = (Get-Content (Join-Path $tmpDir $pp)) -creplace "\`$reposName = 'testrepos'", "`$reposName = '$($reposName)'"
    $contents | Out-File (Join-Path $tmpDir $pp)
}
svn import $tmpDir $svnURLDefaultPaths[3] -m "import scripts for $($reposName)."
Remove-Item -Recurse $tmpDir

# チェックアウト
svn checkout $svnURLDefaultPaths[0] $workingCopyDir
svn checkout $svnURLDefaultPaths[3] $scriptsDir
