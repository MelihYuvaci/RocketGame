//
//  GameScene.swift
//  RocketGame
//
//  Created by Melih Yuvacı on 24.03.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    var rocket = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    var box7 = SKSpriteNode()
    var box8 = SKSpriteNode()
    var box9 = SKSpriteNode()


    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Rocket = 1
        case Box = 2
    }
    
    override func didMove(to view: SKView) {
        
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        rocket = childNode(withName: "rocket") as! SKSpriteNode
        
        let rocketTexture = SKTexture(imageNamed: "rocket")
        
        rocket.physicsBody = SKPhysicsBody(circleOfRadius: rocketTexture.size().height / 13)
        rocket.physicsBody?.affectedByGravity = false
        rocket.physicsBody?.isDynamic = true
        rocket.physicsBody?.mass = 0.15
        originalPosition = rocket.position

        rocket.physicsBody?.contactTestBitMask = ColliderType.Rocket.rawValue
        rocket.physicsBody?.categoryBitMask = ColliderType.Rocket.rawValue
        rocket.physicsBody?.collisionBitMask = ColliderType.Box.rawValue

        
        
        let boxTexture = SKTexture(imageNamed: "Stone")
        let size = CGSize(width: boxTexture.size().width / 6, height: boxTexture.size().height / 6)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        
        box1.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        
        box2.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue

        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        
        box3.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue

        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        
        box4.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue

        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        box5.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue

        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.4
        box6.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: size)
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.allowsRotation = true
        box7.physicsBody?.mass = 0.4
        box7.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue
     
        box8 = childNode(withName: "box8") as! SKSpriteNode
        box8.physicsBody = SKPhysicsBody(rectangleOf: size)
        box8.physicsBody?.isDynamic = true
        box8.physicsBody?.affectedByGravity = true
        box8.physicsBody?.allowsRotation = true
        box8.physicsBody?.mass = 0.4
        box8.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue
        
        box9 = childNode(withName: "box9") as! SKSpriteNode
        box9.physicsBody = SKPhysicsBody(rectangleOf: size)
        box9.physicsBody?.isDynamic = true
        box9.physicsBody?.affectedByGravity = true
        box9.physicsBody?.allowsRotation = true
        box9.physicsBody?.mass = 0.4
        box9.physicsBody?.collisionBitMask = ColliderType.Rocket.rawValue
        //Label
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.fontColor = .black
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.Rocket.rawValue || contact.bodyB.collisionBitMask == ColliderType.Rocket.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
            
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == rocket {
                                rocket.position = touchLocation
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == rocket {
                                rocket.position = touchLocation
                            }
                        }
                        
                    }
                    
                }
                
            }
            
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let touchNodes = nodes(at: touchLocation)
            
            if touchNodes.isEmpty == false {
                
                for node in touchNodes {
                    
                    if let sprite = node as? SKSpriteNode {
                        if sprite == rocket {
                           
                            let dx = -(touchLocation.x - originalPosition!.x)
                            let dy = -(touchLocation.y - originalPosition!.y)
                            
                            let impulse = CGVector(dx: dx, dy: dy)
                            
                            rocket.physicsBody?.applyImpulse(impulse)
                            rocket.physicsBody?.affectedByGravity = true
                            
                            gameStarted = true
                            
                        }
                    }
                    
                }
                
            }
            
        }
        
        
    }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let rocketPhysicsBody = rocket.physicsBody {
            
            if rocketPhysicsBody.velocity.dx <= 0.1 && rocketPhysicsBody.velocity.dy <= 0.1 && rocketPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                
                rocket.physicsBody?.affectedByGravity = false
                rocket.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                rocket.physicsBody?.angularVelocity = 0
                rocket.zPosition = 1
                rocket.position = originalPosition!
                
                
                score = 0
                scoreLabel.text = String(score)
                
                gameStarted = false
                
                
            }
            
        }
    }
}
