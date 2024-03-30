# Load the Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = '1337x Magnet URL Extractor'
$form.Size = New-Object System.Drawing.Size(400,170)
$form.StartPosition = 'CenterScreen'

# Create the label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Enter 1337x URL:'
$form.Controls.Add($label)

# Create the input field
$inputField = New-Object System.Windows.Forms.RichTextBox
$inputField.Location = New-Object System.Drawing.Point(10,40)
$inputField.Size = New-Object System.Drawing.Size(360,40)
$form.Controls.Add($inputField)

# Create the button
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10,90)
$button.Size = New-Object System.Drawing.Size(360,20)
$button.Text = 'Extract Magnet URL to clipboard'
$button.Add_Click({
    $url = $($inputField.Text)
    $response = Invoke-WebRequest -Uri $url
    $magnetLink = $response.Content | Select-String -Pattern '"(magnet:[^"]+)"'
    $MagnetURL = $($magnetLink.Matches.Value) -replace '"',''
    Set-Clipboard $MagnetURL
})
$form.Controls.Add($button)

# Show the form
$form.ShowDialog()