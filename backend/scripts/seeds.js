//TODO: seeds script should come here, so we'll be able to put some data in our local en

const mongoose = require('mongoose');

require('../models/User');
require('../models/Item');
require('../models/Comment');

var Item = mongoose.model('Item');
var Comment = mongoose.model('Comment');
var User = mongoose.model('User');

//connect to mongodb
if(process.env.MONGODB_URI){
    mongoose.connect(process.env.MONGODB_URI);
}else{
    console.warn('Please set the MONGODB_URI environment variable');
}

let userID;
let itemID;

async function seedDB(){

    //User seed data
    const users = Array.from(Array(100)).map((_item,i) => ({
        username: `fakeusers${i}`,
        email: `fakeuser${i}@gmail.com`,
        bio: `test bio`,
        image : 'https://picsum.photos/200',
        role: 'user',
        favorites: [],
        following: []

    }))
    for(let user of users){
        const u = new User(user);
        
        const dbItem = await u.save();

        if(!userID){
            userID = dbItem._id;
        }
    }

    //Item seed data
    const items = Array.from(Array(100)).map((_item,i) => ({
        slug: `fakeitem${i}`,
        title: `fake item ${i}`,
        description: `fake item ${i} description`,
        image: 'https://picsum.photos/200/',
        comments: [],
        tagList: [],
        seller: userID
    }))
    for(let item of items){
        const i = new Item(item);

        const dbItem = await i.save();

        if(!itemID){
            itemID = dbItem._id;
        }
    }

    //Comment seed data
    const comments = Array.from(Array(100)).map((_item,i) => ({
        body: `fake comment ${i}`,
        seller: userID,
        item: itemID
    }))
    for(let comment of comments){
        const c = new Comment(comment);

        const dbItem = await c.save();

        if(!itemID){
            itemID = dbItem._id;
        }
    }

}
    


seedDB().then(() => {
    process.exit();
}).catch(err => {
    console.error(err);
    process.exit(1);
});