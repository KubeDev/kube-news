const sequelize = require('sequelize');

const DB_DATABASE = process.env.DB_DATABASE || "kubedevnews";
const DB_USERNAME = process.env.DB_USERNAME || "kubedevnews";
const DB_PASSWORD = process.env.DB_PASSWORD || "Pg#123";
const DB_HOST = process.env.DB_HOST || "localhost";

const seque = new sequelize.Sequelize(DB_DATABASE, DB_USERNAME, DB_PASSWORD, {
    host: DB_HOST,
    dialect: 'postgres'
  });

class Post extends sequelize.Model {
  
  save() {
    
    console.log('Entrou')
    super.save();
  }
}

Post.init({
  title: {
    type: sequelize.DataTypes.STRING,
    require: true
  },
  summary: {
    type: sequelize.DataTypes.STRING,
    require: true
  },
  publishDate: {
    type: sequelize.DataTypes.DATEONLY,
    require: true
  },
  content: {
    type: sequelize.DataTypes.STRING,
    require: true
  },
}, {
  sequelize: seque, // We need to pass the connection instance
  modelName: 'Post' // We need to choose the model name
})

exports.initDatabase = () => {
    seque.sync({ alter: true })
}

exports.Post = Post;

