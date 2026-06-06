$pdf_url = 'https://prioritas.bca.co.id/' + (iwr https://prioritas.bca.co.id/en/Wealth-Management/Market-Insight/House-View-Report | % Links | % href | sls 'pdf\Z')[0]
Start-BitsTransfer $pdf_url -Destination bca-wealth.pdf
.\pdftotext bca-wealth.pdf

''
'Summary: ' + (Get-Date -Format 'yyyy MMMM')

$bca = gc bca-wealth.txt
$bca | sls 'Cash/Deposit IDR' -NoEmphasis
$bca | sls 'Fixed Income USD' -NoEmphasis
$bca | sls 'Fixed Income IDR' -NoEmphasis
$bca | sls 'Equity USD' -NoEmphasis
$bca | sls 'Equity IDR' -NoEmphasis


ri -Force bca-wealth.pdf, bca-wealth.txt


