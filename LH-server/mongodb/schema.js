const portfolioSchema = new mongoose.Schema({
    _id: ObjectId,
    email:String,
    portfolio: String,
    datetime: String,
    color: String,
    img: String,
    lists: [String]

  });

  const userSchema = new mongoose.Schema({
    _id: ObjectId,
    email:String,
    password: String
  });

  export const Mportfolio = mongoose.model('portfolio', portfolioSchema);
  export const Muser = mongoose.model('user', userSchema);