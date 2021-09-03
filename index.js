const express = require('express')
const app = express();
const axios = require('axios')
const fs = require('fs');
var Jimp = require('jimp');
let bodyParser = require('body-parser')

app.use(bodyParser.urlencoded({extended: true}))
var Request = require("request")
let quote

app.get('/', (req, res) => {
    res.send("hola mundo")
})

app.post('/getQuote', async (req, res) => { 
    Request.get("https://api.kanye.rest", { json: true },
        (error, response, body) => {
        if(error) {
            return console.dir(error);
        }
        console.log(body.quote)
    quote =  (body.quote)
    console.log(quote)
    var x = JSON.parse(req.query.file)
    buffer = Buffer.from(x.data)
    fs.createWriteStream(__dirname + '/img.png').write(buffer);
    getQuote(res, quote)
    })  
})

async function getQuote(res, q){
    const image = await Jimp.read(__dirname + '/img.png');
    const font = await Jimp.loadFont(Jimp.FONT_SANS_10_BLACK);
    await image.print(font, 5, 10, q);
    await image.writeAsync(__dirname + '/img1.png');
    const base64 = await fs.readFileSync(__dirname + '/img1.png', "base64");
    console.log(base64)
    res.send(base64);
}

app.listen(2000, () => { 
    console.log('App listening on 2000')
})
