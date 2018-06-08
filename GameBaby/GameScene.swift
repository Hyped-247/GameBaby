//
//  GameScene.swift
//  GameBaby
//
//  Created by Mohammad on 6/6/18.
//  Copyright © 2018 Mohammad Mahjoub. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.gray
        self.scaleMode = .aspectFit
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        
        let ball = SKSpriteNode.init(imageNamed: "babyrashmain.png")
        ball.setScale(0.2)
        ball.position = CGPoint.init(x: self.size.width/2.0, y: self.size.height/2.0)
        ball.physicsBody = SKPhysicsBody.init(circleOfRadius: ball.size.width/2.0)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.friction = 0.0
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.velocity = CGVector.init(dx: 0.0, dy: 200.0)
        self.addChild(ball)
        
        let ball2 = SKSpriteNode.init(imageNamed: "babyrashmain.png")
        ball2.setScale(0.2)
        ball2.position = CGPoint.init(x: self.size.width/2.0, y: self.size.height/2.0)
        ball2.physicsBody = SKPhysicsBody.init(circleOfRadius: ball.size.width/2.0)
        ball2.physicsBody?.isDynamic = true
        ball2.physicsBody?.friction = 0.0
        ball2.physicsBody?.restitution = 1.0
        ball2.physicsBody?.linearDamping = 0.0
        ball2.physicsBody?.velocity = CGVector.init(dx: 2, dy: 200.0)
        self.addChild(ball2)
        
        
        let ball3 = SKSpriteNode.init(imageNamed: "babyrashmain.png")
        ball3.setScale(0.2)
        ball3.position = CGPoint.init(x: self.size.width/2.0, y: self.size.height/2.0)
        ball3.physicsBody = SKPhysicsBody.init(circleOfRadius: ball.size.width/2.0)
        ball3.physicsBody?.isDynamic = true
        ball3.physicsBody?.friction = 0.0
        ball3.physicsBody?.restitution = 1.0
        ball3.physicsBody?.linearDamping = 0.0
        ball3.physicsBody?.velocity = CGVector.init(dx: 7, dy: 200.0)
        self.addChild(ball3)
                
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
