const db = require('../db/models');
const userModel = db.User

exports.findAll=(req,res)=>{

    userModel.findAll()

        .then(data=>res.json(data))

        .catch(err=>{

            res.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

// 2. seelct * from users where id=?=>findByPK

exports.findByPK=(req,res)=>{

    const id=parseInt(req.params.id);

    User.findByPK(id)

        .then(data=>res.json(data))

        .catch(err=>{

            res.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });
};





exports.createUser = (req, res) => {
    userModel.create({
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        createdAt: new Date(),
        updatedAt: new Date()
        
    })
        .then(data => {
            res.json(data);
            alert("User created successfully");
        })
        .catch(err => {
            res.status(500)
                .send({ message: err.message || `Something went wrong` })
        });
} ;

exports.updateUser = (req, res) => {
    const id = parseInt(req.params.id);
    userModel.update({
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        createdAt: new Date(),
        updatedAt: new Date()
    }, {
            where: {
                id: id
            }
        })
        .then(data => {
            res.json(data);
            alert("User updated successfully");
        })
        .catch(err => {
            res.status(500)
                .send({ message: err.message || `Something went wrong` })
        });
};


exports.deleteUser = (req, res) => {
    const id = parseInt(req.params.id);
    userModel.destroy({
        where: {
            id: id
        }
    })
        .then(data => {
            res.json(data);
            alert("User deleted successfully");
        })
        .catch(err => {
            res.status(500)
                .send({ message: err.message || `Something went wrong` })
        });
};