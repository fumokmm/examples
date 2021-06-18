$reposName = 'testrepos'
$remoteBaseDir = 'N:\repos\svn\'

# �v��������
function doPull {
    param(
        $localReposDir,
        $remoteReposDir,
        $syncRevision,
        $localRevision
    )

    # ���[�J�����|�W�g����ޔ�
    robocopy $localReposDir (Join-Path $PSScriptRoot "\..\repos_bk\repos_$((Get-Date).ToString('yyyyMMddHHmmss'))_r$($($syncRevision))to$($localRevision)") /MIR /E /R:1
    # ���|�W�g���t�H���_�̃R�s�[�����s
    robocopy $remoteReposDir $localReposDir /MIR /E /R:1
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

# �O�񓯊����ƃ����[�g���r�W�����������ꍇ�Apull�s�v
if ($remoteRevision -eq $syncRevision) {
    Write-Host '�O�񓯊��������烊���[�g���|�W�g���ɍX�V���Ȃ����߁APull�̕K�v������܂���B'
    exit 0

# �O�񓯊��������������[�g���r�W���������������ꍇ�A��Ԃ���
} elseif ($remoteRevision -lt $syncRevision) {
    Write-Host "��Ԃ��ςł��B�O�񓯊��������������[�g���|�W�g�����Â��Ȃ��Ă��܂��B�O�񓯊������̃��r�W����:$syncRevision�A�����[�g�̃��r�W����:$remoteRevision"
    exit 1

# �O�񓯊�����Ƀ����[�g���r�W�������オ�����ꍇ�Apull�\
} else {
    # Write-Host 'Pull�\�ł��B'
    
    # �O�񓯊������������[�J�����r�W�������オ���Ă���ꍇ�A�m�F���b�Z�[�W�����Ă���Pull����
    if ($syncRevision -lt $localRevision) {
        $objYes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "���s����"
        $objNo = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "��߂Ă���"
        $objOptions = [System.Management.Automation.Host.ChoiceDescription[]]($objYes, $objNo)
        $objMessage = @"
�����[�g���ŐV�ł����A���[�J���ɂ��R�~�b�g���Ă��܂��B
���[�J��: $($syncRevision) -> $($localRevision)
�����[�g: $($syncRevision) -> $($remoteRevision)
��Pull����ƃ��[�J���ɃR�~�b�g�������e�͎����܂��̂ŁA�f�[�^��ޔ�����Ȃ肵�Ĕ����ĉ������B
"@
        $resultVal = $host.ui.PromptForChoice('���s���܂����H', $objMessage, $objOptions, 1)
        if ($resultVal -ne 0) {
            Write-Host "���������f����܂����B"
            exit 0
        }
    }
    
    # �v�������s
    doPull -localReposDir $localReposDir `
           -remoteReposDir $remoteReposDir `
           -syncRevision $syncRevision `
           -localRevision $localRevision

    # �������������r�W�������X�V
    updateSyncRevision -newRevision $remoteRevision

    exit 0
}
