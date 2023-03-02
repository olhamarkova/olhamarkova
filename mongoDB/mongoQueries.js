show databases;

use test;

db.createCollection("courses");

show collections;

db.courses.insertOne({
  name: "Postman",
  author: "Valentin Despa",
  site: "Udemy",
  isFree: false,
  });

db.courses.findOne(ObjectId("63fb687b095313a1a85812ef"));

db.courses.insertMany(
[
  {
  name: "Java Script",
  author: "Bogdan Staschuk",
  site: "Udemy",
  isFree: false,
  },
  {
    name: "Api Testing",
    author: "Amber Race",
    site: "TAU",
    isFree: true,
    },
    {
      name: "Test Automation for Accessibility",
      author: "Marie Cruz",
      site: "Udemy",
      isFree: true,
      },  
]

);

db.courses.find();

db.courses.find({site: "TAU"});

db.courses.find({isFree: false});

db.courses.find({$or:[{site: "Udemy"}, {isFree: false}]});

db.courses.find().sort({name: -1});

db.courses.find().sort({name: 1});

db.courses.find().limit(2);

db.courses.updateOne(
  {author: "Marie Cruz"}, 
  {
    $set: {
      site: "TAU"
    }
  }
);

db.courses.updateMany(
  {}, 
  {
    $rename: {
      name: "title",
      site: "resource"
    }
  }
);

db.courses.bulkWrite( 
  [
    {insertOne: {
      document: {
        title: "Web Element Locator Strategies",
        author: "Andrew Knight",
        c: "TAU",
        isFree: true,
      }
    }},
    {
      deleteOne: {
        filter: {
          author: "Amber Race"
        }
      }
    }
  ]
);

db.courses.updateOne(
  {author: "Andrew Knight"},
  {
    $set: {
      rewievs: [
        {student: "John", text: "Amazing!"},
        {student: "Jane", text: "Greate course!"},
        {student: "Mike", text: "Thank you!"},

      ]

      }
    }
);

db.courses.findOne({author: "Andrew Knight"}, {rewievs: 1});

db.courses.find(
  {
    rewievs: {
      $elemMatch: {
        student: "John"
      }
    }
  },
  );

db.courses.find({rewievs: {$exists: true}});

db.courses.updateMany(
  {c: "TAU"}, 
  {
    $set: {
      c: "https://testautomationu.applitools.com/"
    }
  }
);

db.courses.updateOne(
  {author: "Valentin Despa"}, 
  {
    $set: {
      title: "Postman: The Complete Guide - REST API Testing"
    }
  }
);

db.courses.updateOne(
  {author: "Bogdan Staschuk"}, 
  {
    $set: {
      title: "JavaScript - Полный Курс по JavaScript (Включает 80 Задач)",
      author: "Bogdan Stashchuk"
    }
  }
);

db.courses.updateMany(
  {}, 
  {
    $set: {
      type: "AQA"
    }
  }
);

db.courses.updateOne(
  {author: "Black Screen"}, 
  {
    $set: {
      c: "https://www.tiktok.com/@blackscreenenglish?_t=8XU8Mzs2QQX"
    }
  }
);

db.courses.deleteOne( {author: "Artsiom Rusau"} )
