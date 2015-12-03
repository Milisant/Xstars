exports.show =function (req, res, next){
    req.getConnection(function(err, connection){
        if (err) return next(err);
		//connection.query('SELECT Qty AS AmtSold ,Sales_date, Sales_price,  product_name from Sales s INNER JOIN Products p ON s.Product_Id = p.Id ORDER BY Sales_date DESC',[], function(err, results){
        //connection.query('SELECT Sales.Id,Products.product_name,Sales.Qty,DATE_FORMAT(Sales.Sales_date, "%d/%m/%Y") as Sales_date,Sales.qty,Sales.Sales_price FROM Sales INNER JOIN Products ON Sales.Product_Id = Products.Id ORDER BY Sales.Sales_date DESC',[],function(err, results){
            connection.query('SELECT * from Issues',[], function(err, issues){
            	if (err) return next(err);
            	res.render('home',{
            	no_issues : results.length === 0,
            	//sales : results,
            	issues : issues
            	});
            });
        });
	
}


exports.add = function (req, res, next) {
    req.getConnection(function(err, connection){
        if (err) return next(err);
        var input = JSON.parse(JSON.stringify(req.body));
        var data = {

            description : input.description,
            date :input.date,
            start_location_latitude : input.latitude,
            start_location_longitude :input.longitude,
            start_location_time:input.time
            
            //end_location_latitude:input.latitude,
            //end_location_longitude: input.longitudes,
            //end_location_time: input.time,
            //start_location_longitude : input.latitude, 
            //end_location_id : input.latitude,
            //taxiAssociation_name : input.taxiAssociation_name,
            //Rank_name: input.Rank_name

        };      
             
        connection.query('insert into Issues set ?', data, function(err, results){
            if (err) return next(err);
            console.log("Error inserting : %s ",err );
            res.redirect('/issues');
        });
    });
}

exports.update = function(req, res, next){

    var data = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;
    req.getConnection(function(err, connection){
            connection.query('UPDATE Issues SET ? WHERE id = ?',[data, id], function(err, rows){
                if (err) return next(err);
                res.redirect('/issues');
            });

    });
}

exports.get = function(req, res, next){
    var Id = req.params.Id;
    req.getConnection(function(err, connection){
        connection.query('SELECT * FROM Issues WHERE Id = ?', [Id], function(err,rows){
            connection.query('SELECT * FROM Taxi_associations', [], function(err, results) {   
                if(err) return next(err);
                console.log(results);
                res.render('edit',{page_title:"Edit Issues - Node.js", 
                data : rows[0],
                associations : results
                });
            });
        });
    });
}

exports.delete = function(req, res, next){
    var id = req.params.id;
    req.getConnection(function(err, connection){
        connection.query('DELETE FROM Issues WHERE id = ?', [id], function(err,rows){
            if(err) return next(err);
            res.redirect('/issues');
        });
    });
}