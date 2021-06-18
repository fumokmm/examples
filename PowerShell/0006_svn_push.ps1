$reposName = 'testrepos'
$remoteBaseDir = 'N:\repos\svn\'

# �v�b�V��������
function doPush {
    param(
        $reposName,
        $remoteBaseDir,
        $localReposDir,
        $remoteReposDir
    )
    # ���|�W�g���t�H���_�̃R�s�[�����s
    robocopy $localReposDir $remoteReposDir /MIR /E /R:1
    
    if ($remoteBaseDir.Substring(1, 1) -eq ':') {
        $remoteReposSvnPath = 'file:///' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    } else {
        $remoteReposSvnPath = 'file:' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    }

    # TortoiseSvn��Repository Browser�̃V���[�g�J�b�g���쐬
    $wshShell = New-Object -ComObject WScript.Shell
    $linkPath = Join-Path (Join-Path $remoteBaseDir $reposName) ($reposName + '(SVN).lnk')
    $shortcut = $wshShell.CreateShortcut($linkPath)
    $shortcut.TargetPath = "`"C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe`""
    $shortcut.Arguments = "/command:repobrowser /path:`"$($remoteReposSvnPath)`""
    $shortcut.IconLocation = "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe"
    $shortcut.WorkingDirectory = "C:\Program Files\TortoiseSVN\bin"
    $shortcut.Save()
}

# ���|�W�g���̃��r�W�����ԍ��𒲂ׂ�
# ���|�W�g�����Ȃ��ꍇ�A���r�W����0��ԋp
function getReposRevision {
    param(
        $reposDir # ���|�W�g���̃f�B���N�g��
    )
    if (($reposDir -ne $null) -and (Test-Path $reposDir) -eq $True) {
        return [int](Get-Content (Join-Path (Join-Path $reposDir 'db') 'current'))
    } else {
        return [int]0
    }
}


# �������������r�W�������X�V
function updateSyncRevision{
    param(
        $newRevision
    )
    Set-Content -Path (Join-Path $PSScriptRoot \..\.syncrevision) -Value $newRevision
}

######################################
# �������烁�C������
######################################

$localReposDir = Resolve-Path (Join-Path $PSScriptRoot \..\repos)
$remoteReposDir = Join-Path (Join-Path $remoteBaseDir $reposName) 'repos'

# ���|�W�g���̃��r�W�����𒲂ׂ�
$localRevision = getReposRevision -reposDir $localReposDir
$remoteRevision = getReposRevision -reposDir $remoteReposDir
if ((Test-Path (Join-Path $PSScriptRoot \..\.syncrevision))) {
    $syncRevision = [int](Get-Content (Join-Path $PSScriptROot \..\.syncrevision))
} else {
    $syncRevision = [int]0
}
Write-Host "local  : $localRevision"
Write-Host "remote : $remoteRevision"
Write-Host "sync   : $syncRevision"

# �O�񓯊������烍�[�J�����r�W�����������ꍇ�Apush�s�v
if ($localRevision -eq $syncRevision) {
    Write-Host '�O�񓯊��������烍�[�J�����|�W�g���ɍX�V���Ȃ����߁APush�̕K�v������܂���B'
    exit 0

# �O�񓯊������������[�J�����r�W���������������ꍇ�A��Ԃ���
} elseif ($localRevision -lt $syncRevision) {
    Write-Host "��Ԃ��ςł��B�O�񓯊������������[�J�����|�W�g�����Â��Ȃ��Ă��܂��B�O�񓯊������̃��r�W����:$syncRevision�A���[�J���̃��r�W����:$localRevision"
    exit 1

# �O�񓯊�����Ƀ��[�J�����r�W�������オ�����ꍇ�Apush�\
} else {
    # Write-Host 'Push�\�ł��B'
    
    # �O�񓯊��������������[�g���r�W�������オ���Ă���ꍇ
    if ($syncRevision -lt $remoteRevision) {
        Write-Host '�����[�g���ŐV�ł��B���Pull���ĉ������B'
        Write-Host '��Pull����ƃ��[�J���ɃR�~�b�g�������e�͎����܂��̂ŁA�f�[�^��ޔ�����Ȃ肵�Ĕ����ĉ������B'
        exit 0

    # �O�񓯊��������������[�g���r�W�������������Ă���ꍇ
    } elseif ($syncRevision -gt $remoteRevision) {
        Write-Host "��Ԃ��ςł��B�O�񓯊������������[�g���|�W�g�����Â��Ȃ��Ă��܂��B�O�񓯊������̃��r�W����:$syncRevision�A�����[�g�̃��r�W����:$remoteRevision"
        exit 1

    # �O�񓯊������ƃ����[�g���r�W�����������ꍇ
    } else {
        # Write-Host 'Push�\�ł��B'
        
        # �v�b�V�������s
        doPush -reposName $reposName `
               -remoteBaseDir $remoteBaseDir `
               -localReposDir $localReposDir `
               -remoteReposDir $remoteReposDir

        # �������������r�W�������X�V
        updateSyncRevision -newRevision $localRevision
    }
}
