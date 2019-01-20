coins = [
  {description: 'BitCoin',  acronym: 'BTC', url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG48.png' },
  {description: 'Ethereum', acronym: 'ETH', url_image: 'https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png' }
]

coins.each do |c|
  Coin.find_or_create_by!(c)
end

