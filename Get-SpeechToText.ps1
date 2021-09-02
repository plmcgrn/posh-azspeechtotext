function Get-SpeechToText() {
  <#
.SYNOPSIS
  Takes a WAV file with spoken words and retrieves the text via Azure Cognitive Services
.DESCRIPTION
  Takes a WAV file with spoken words and retrieves the text via Azure Cognitive Services
.PARAMETER SubscriptionKey
  The Speech Services API key for this Cognitive Speech Service object
.PARAMETER Token
  Token received after calling Get-SpeechAccessToken  
.PARAMETER Path
  The full path to the file
.PARAMETER Region
  The Azure region where the Speech Service resides, ex. "eastus"
.PARAMETER Language
  The language code to use, ex. "en-US"
#>
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true)] [Alias("FilePath")] [String] $path,
    [Parameter(Mandatory = $true)] [string] $Token,
    [Parameter(Mandatory = $true)] [string] $Region,
    [Parameter(Mandatory = $false)] [string] $Format = "simple",
    [Parameter(Mandatory = $false)] [Alias("LangCode")] [string] $Language = "en-US"
  )

  # Read audio into byte array
  $audioBytes = [System.IO.File]::ReadAllBytes($path)
    
  # Conversion URI
  $conversionUri = "https://$Region.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=$Language&format=$format"

  # Conversion Headers
  $Headers = @{        
    'Authorization' = "Bearer " + $token;        
    'Content-type'  = 'audio/pcm; codec=audio/pcm; samplerate=16000'
  }
  # Convert
  $result = Invoke-RestMethod -Method POST -Uri $conversionURI -Headers $Headers -Body $audioBytes -SkipHeaderValidation -TransferEncoding "chunked"
  # Result
  return $result

}