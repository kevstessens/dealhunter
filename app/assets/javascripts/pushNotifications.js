/**
 * Created with JetBrains RubyMine.
 * User: Personal
 * Date: 18/09/13
 * Time: 10:21
 * To change this template use File | Settings | File Templates.
 */
function startFaye(){
    var faye = new Faye.Client('http://localhost:9292/faye');
    alert("Connecting..");
    faye.subscribe('/users/home', function(data){
        alert(data);
    })
}
