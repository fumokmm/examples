# �e�L�X�g�t�@�C���̏�������
$str = @'
aaaaa
����������
1234567890
'@

# �ʏ�̎g�����A-Path�ŏo�͐���w�肵�A -Value �ŏo�͂�����e���w�肷��
Set-Content -Path C:\temp\out.txt -Value $str

# -Value �͏ȗ���
Set-Content -Path C:\temp\out2.txt $str

# -Value �̓p�C�v���C���ł��󂯎���
Get-ChildItem C:\temp | Set-Content -Path C:\temp\out3.txt

## �Q�l
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-content?view=powershell-7.1

