function ssh_kill_open_sessions()
{
  ps aux | grep 'ssh -' | awk '{print $2}' | xargs sudo kill
}

function is_same_checksum()
{
    set -u

    expectedChecksum=$2
    actualChecksum=$(openssl dgst -sha1 $1|awk '{print $2}')

    if [ $actualChecksum = $expectedChecksum ]
    then
        echo "Checksums match!"
    else
        echo "Checksums don't match!"
    fi

    unset u
}

function gpg_keys()
{
    gpg --list-secret-keys --keyid-format LONG
}

function gpg_encrypt()
{
    set -u

    fileName=$1
    gpg --cipher-algo AES256 --compress-algo zip -o $fileName.gpg -c $fileName

    unset u
}

function gpg_decrypt()
{
    set -u

    fileNameEnc=$1
    fileNameDec=$2
    gpg --output $fileNameDec -d $fileNameEnc

    unset u
}

function gpg_encrypt_dir()
{
    set -u

    fileName=$1
    zip -r fileName.zip fileName
    gpg --cipher-algo AES256 --compress-algo zip -o $fileName.gpg -c $fileName.zip
    rm fileName

    unset u
}

function save_mindly()
{
  set -u

  fileName=$1
  gpg_encrypt $fileName
  mv $fileName.gpg ~/Dropbox/Apps/Mindly/
  rm $fileName

  unset u
}

function open_mindly()
{
  set -u

  fileNameEnc=$1
  # Take only the file name, i.e. /foo/bar/foobar.txt -> foobar.txt
  fileName=${fileNameEnc##*/}
  fileNameDec=${fileName%.*}
  gpg_decrypt $fileNameEnc $fileNameDec
  open -a /Applications/Mindly.app ./$fileNameDec

  unset u
}

function qopen_mindly()
{
  set -u

  fileName=${1}.mindly.gpg
  open_mindly ~/Dropbox/Apps/Mindly/$fileName

  unset u
}

function sbf()
{
  stack build --fast --ghc-options "-optP-Wno-nonportable-include-path" "$@"
}
