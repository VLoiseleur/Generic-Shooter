package de.pixelate.flixelprimer{
import org.flixel.*;

public class PlayState extends FlxState{
	//[Embed(source="../../../../assets/mp3/ExplosionShip.mp3")] private var SoundExplosionShip:Class;
	//[Embed(source="../../../../assets/mp3/ExplosionAlien.mp3")] private var SoundExplosionAlien:Class;
	//[Embed(source="../../../../assets/mp3/Bullet.mp3")] private var SoundBullet:Class;
	
	private var _bg: Background;
	private var _ship: Ship;
	private var _hitbox: Hitbox;
	private var _aliens: FlxGroup;
	private var _alien2: FlxGroup;
	private var _bullet: FlxGroup;
	private var _bullet2: FlxGroup;
	private var _spread1: FlxGroup;
	private var _spread2: FlxGroup;
	private var _spread3: FlxGroup;
	private var _spread4: FlxGroup;
	private var _spread5: FlxGroup;
	private var _powerups: FlxGroup;
	private var _bulletState: Number;
	private var _scoreText: FlxText;
	private var _gameOverText: FlxText;
	private var _spawnTimer: Number;
	private var _spawnTimer2: Number = 20;
	private var _spawnInterval: Number = 2;
	private var _spawnInterval2: Number = 10;
	private var _powerupTimer: Number = 10;

	override public function create():void {
		//Score counter
		FlxG.score = 0;

		//Set color for level background
		//bgColor = 0xFFABCC7D;
		
		_bg = new Background();
		add(_bg);
		
		_ship = new Ship();
		add(_ship);
		
		_hitbox = new Hitbox();
		add(_hitbox);

		_aliens = new FlxGroup();
		add(_aliens);
		
		_alien2 = new FlxGroup();
		add(_alien2);

		_bullet = new FlxGroup();
		add(_bullet);
		
		_bullet2 = new FlxGroup();
		add(_bullet2);

		_spread1 = new FlxGroup();
		add(_spread1);
		
		_spread2 = new FlxGroup();
		add(_spread2);
		
		_spread3 = new FlxGroup();
		add(_spread3);
		
		_spread4 = new FlxGroup();
		add(_spread4);
		
		_spread5 = new FlxGroup();
		add(_spread5);
		
		_powerups = new FlxGroup();
		add(_powerups);
		
		_scoreText = new FlxText(10, 8, 200, "Score");
		_scoreText.setFormat(null, 15, 0xFF000000, "left");
		add(_scoreText);
		
		_scoreText = new FlxText(5, 8, 200, "0");
		_scoreText.setFormat(null, 15, 0xFF000000, "center");
		add(_scoreText);

		//State of current default weapon (power-ups, etc)
		_bulletState = 0;
		
		resetSpawnTimer();
		resetSpawnTimer2();
		
		super.create();
	}

	override public function update():void{
		FlxU.overlap(_aliens, _bullet, overlapAlienBullet);
		FlxU.overlap(_alien2, _bullet, overlapAlien2Bullet);
		FlxU.overlap(_aliens, _spread1, overlapAlienBullet);
		FlxU.overlap(_aliens, _spread2, overlapAlienBullet);
		FlxU.overlap(_aliens, _spread3, overlapAlienBullet);
		FlxU.overlap(_aliens, _spread4, overlapAlienBullet);
		FlxU.overlap(_aliens, _spread5, overlapAlienBullet);
		FlxU.overlap(_alien2, _spread1, overlapAlien2Bullet);
		FlxU.overlap(_alien2, _spread2, overlapAlien2Bullet);
		FlxU.overlap(_alien2, _spread3, overlapAlien2Bullet);
		FlxU.overlap(_alien2, _spread4, overlapAlien2Bullet);
		FlxU.overlap(_alien2, _spread5, overlapAlien2Bullet);
		FlxU.overlap(_aliens, _hitbox, overlapAlienShip);
		FlxU.overlap(_alien2, _hitbox, overlapAlien2Ship);
		FlxU.overlap(_bullet2, _hitbox, overlapAlienBulletShip);
		FlxU.overlap(_powerups, _ship, overlapPowerupShip);

		if (FlxG.keys.justPressed("SPACE") && _ship.dead == false) {
			if(_bulletState == 0){
				spawnBullet(_ship.getBulletSpawnPosition());
			}
		
			//Set shooting method to spreadshot
			else if (_bulletState == 1) {
				spawnSpread1(_ship.getBulletSpawnPosition());
			}
			
			//Set shooting method to spreadshot 2
			else if (_bulletState == 2) {
				spawnSpread2(_ship.getBulletSpawnPosition());
			}
		}

		if(FlxG.keys.ENTER && _ship.dead){
			FlxG.state = new PlayState();
		}

		_spawnTimer -= FlxG.elapsed;
		_spawnTimer2 -= FlxG.elapsed;
		_powerupTimer -= FlxG.elapsed;

		//Spawn more enemies if spawn timer hits 0
		if(_spawnTimer < 0){
			spawnAlien();
			resetSpawnTimer();
		}
		
		//Spawn more enemies if spawn timer hits 0
		if(_spawnTimer2 < 0){
			spawnAlien2();
			resetSpawnTimer2();
		}
		
		super.update();
	}

//Spawns enemies based on frame size (right border)
private function spawnAlien():void{
	var x: Number = Math.random() * (FlxG.width - 100) + 50;
	_aliens.add(new Alien(x, -50));
}

//Spawns enemies based on frame size (right border)
private function spawnAlien2():void{
	var x: Number = Math.random() * (FlxG.width - 100) + 50;
	_alien2.add(new Alien2(x, -50));
}

//Function for spawning power-ups
private function spawnPowerup(p: FlxPoint):void{
	_powerups.add(new Powerup(p.x, p.y));
	_powerups.velocity.y = -20
}

//Function to spawn bullets when an enemy dies
private function spawnEnemyBullet(p: FlxPoint):void{
	var enemyShot1: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot2: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot3: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot4: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot5: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot6: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot7: Bullet2 = new Bullet2(p.x, p.y);
	var enemyShot8: Bullet2 = new Bullet2(p.x, p.y);
	enemyShot2.velocity.x = 200;
	enemyShot2.velocity.y = 0;
	enemyShot3.velocity.x = -200;
	enemyShot3.velocity.y = 0;
	enemyShot4.velocity.x = 0;
	enemyShot4.velocity.y = -200;
	enemyShot5.velocity.x = -200;
	enemyShot5.velocity.y = -200;
	enemyShot6.velocity.x = 200;
	enemyShot6.velocity.y = 200;
	enemyShot7.velocity.x = 200;
	enemyShot7.velocity.y = -200;
	enemyShot8.velocity.x = -200;
	enemyShot8.velocity.y = 200;
	_bullet2.add(enemyShot1);
	_bullet2.add(enemyShot2);
	_bullet2.add(enemyShot3);
	_bullet2.add(enemyShot4);
	_bullet2.add(enemyShot5);
	_bullet2.add(enemyShot6);
	_bullet2.add(enemyShot7);
	_bullet2.add(enemyShot8);
}

private function spawnBullet(p: FlxPoint):void{
	var bullet: Bullet = new Bullet(p.x, p.y);
	_bullet.add(bullet);
	//FlxG.play(SoundBullet);
}

//Spreadshot Level 1
private function spawnSpread1(p: FlxPoint):void{
	var spread1: Bullet = new Bullet(p.x, p.y);
	var spread2: Bullet = new Bullet(p.x, p.y);
	var spread3: Bullet = new Bullet(p.x, p.y);
	_spread1.add(spread1); 
	_spread2.add(spread2);
	spread2.velocity.x = -100;
	_spread3.add(spread3);
	spread3.velocity.x = 100
	//FlxG.play(SoundBullet);
}

//Spreadshot Level 2
private function spawnSpread2(p: FlxPoint):void {
	var spread1: Bullet = new Bullet(p.x, p.y);
	var spread2: Bullet = new Bullet(p.x, p.y);
	var spread3: Bullet = new Bullet(p.x, p.y);
	var spread4: Bullet = new Bullet(p.x, p.y);
	var spread5: Bullet = new Bullet(p.x, p.y);
	_spread1.add(spread1); 
	_spread2.add(spread2);
	spread2.velocity.x = -100;
	_spread3.add(spread3);
	spread3.velocity.x = 100;
	_spread4.add(spread4);
	spread4.velocity.x = -200;
	_spread5.add(spread5);
	spread5.velocity.x = 200
	//FlxG.play(SoundBullet);
}

//Function for resetting enemy spawn timer
private function resetSpawnTimer():void{
	_spawnTimer = _spawnInterval;
	_spawnInterval *= 0.95;
	if(_spawnInterval < 0.3){
		_spawnInterval = 0.3;
	}
}

private function resetSpawnTimer2():void{
	_spawnTimer2 = _spawnInterval2;
}

//Function for when bullets hit an enemy
private function overlapAlienBullet(alien: Alien, bullet: Bullet):void{
alien.kill();
bullet.kill();
//FlxG.play(SoundExplosionAlien);

//Spawn enemy bullet at destruction location
spawnEnemyBullet(alien.getEnemyBulletSpawnPosition());

//Add to score
FlxG.score += 1;
_scoreText.text = FlxG.score.toString();
}

private function overlapAlien2Bullet(alien2: Alien2, bullet: Bullet):void{
	if(alien2.health == 0){
		alien2.kill();
		bullet.kill();
		//FlxG.play(SoundExplosionAlien);
		
		//Spawn powerup at destruction location
		spawnPowerup(alien2.getAlien2BulletSpawnPosition());
		
		//Add to score
		FlxG.score += 2;
		_scoreText.text = FlxG.score.toString();
	}
	
	else{
		alien2.health -= 1;
		bullet.kill();
	}
}

//Function for when an enemy touches player ship
private function overlapAlienShip(alien: Alien, hitbox: Hitbox):void{
var emitter:FlxEmitter = createEmitter();
emitter.at(hitbox);
_ship.kill();
hitbox.kill();
alien.kill();
FlxG.quake.start(0.02);
//FlxG.play(SoundExplosionShip);

_gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width, "GAME OVER\nPRESS ENTER TO PLAY AGAIN");
_gameOverText.setFormat(null, 16, 0xFF597137, "center");
add(_gameOverText);
}

//Function for when an enemy touches player ship
private function overlapAlien2Ship(alien2: Alien2, hitbox: Hitbox):void{
var emitter:FlxEmitter = createEmitter();
emitter.at(hitbox);
_ship.kill();
hitbox.kill();
alien2.kill();
FlxG.quake.start(0.02);
//FlxG.play(SoundExplosionShip);

_gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width, "GAME OVER\nPRESS ENTER TO PLAY AGAIN");
_gameOverText.setFormat(null, 16, 0xFF597137, "center");
add(_gameOverText);
}

//Function for when an enemy bullet touches player ship
private function overlapAlienBulletShip(bullet2: Bullet2, hitbox: Hitbox):void{
var emitter:FlxEmitter = createEmitter();
emitter.at(hitbox);
_ship.kill();
hitbox.kill();
bullet2.kill();
FlxG.quake.start(0.02);

_gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width, "GAME OVER\nPRESS ENTER TO PLAY AGAIN");
_gameOverText.setFormat(null, 16, 0xFF597137, "center");
add(_gameOverText);
}

//Function for when the ship flies over a power-up
private function overlapPowerupShip(powerup: Powerup, ship: Ship):void {
	powerup.kill();
	if(_bulletState < 2){
	_bulletState += 1;
	}
	else _bulletState = 2;
}

private function createEmitter():FlxEmitter{
	var emitter:FlxEmitter = new FlxEmitter();
	emitter.delay = 1;
	emitter.gravity = 0;
	emitter.maxRotation = 0;
	emitter.setXSpeed(-500, 500);
	emitter.setYSpeed(-500, 500);
	var particles: int = 10;
	for(var i: int = 0; i < particles; i++){
		var particle:FlxSprite = new FlxSprite();
		particle.createGraphic(2, 2, 0xFF597137);
		particle.exists = false;
		emitter.add(particle);
	}
	emitter.start();
	add(emitter);
	return emitter;
}
}
}