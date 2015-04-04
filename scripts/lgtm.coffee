request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.hear /(@*.*)LGTM/i, (msg) ->
    mentions = msg.match[1].replace(/tabby-san/, "")
    url = 'http://www.lgtm.in/g'
    request url, (error, response, body) ->
      if error or response.statusCode != 200
        msg.send 'ERROR: 画像を取得出来ませんでした。'
      else
        $ = cheerio.load body
        msg.send mentions
        msg.send $('#imageUrl').val()
