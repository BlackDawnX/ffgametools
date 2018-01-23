//
//  FFMatrix.swift
//  Previewer
//
//  Created by Aaron on 25/09/2017.
//  Copyright © 2017 Aaron. All rights reserved.
//

import UIKit
import ARKit

class FFMatrix {
//    static func makeTranslate(x: Float, y: Float, z: Float) -> simd_float4x4 {
//        
//    }
    
    /// SIMD 4x4 矩阵旋转，沿 x 轴旋转
    ///
    /// `angle` 是弧度制角度
    static func simd_rotateX(_ node: SCNNode, angle: Float) {
        let matrix = SCNMatrix4(m11: 1, m12: 0,           m13: 0,          m14: 0,
                                m21: 0, m22: cos(angle),  m23: sin(angle), m24: 0,
                                m31: 0, m32: -sin(angle), m33: cos(angle), m34: 0,
                                m41: 0, m42: 0,           m43: 0,          m44: 1)
        let m = simd_float4x4(matrix)
        let trans = simd_mul(node.simdWorldTransform, m)
        node.simdWorldTransform = trans
    }
    
    /// SIMD 4x4 矩阵旋转，沿 y 轴旋转
    ///
    /// `angle` 是弧度制角度
    static func simd_rotateY(_ node: SCNNode, angle: Float) {
        let matrix = SCNMatrix4(m11: cos(angle), m12: 0, m13: -sin(angle), m14: 0,
                                m21: 0,          m22: 1, m23: 0,           m24: 0,
                                m31: sin(angle), m32: 0, m33: cos(angle),  m34: 0,
                                m41: 0,          m42: 0, m43: 0,           m44: 1)
        let m = simd_float4x4(matrix)
        let trans = simd_mul(node.simdWorldTransform, m)
        node.simdWorldTransform = trans
    }
    
    /// SIMD 4x4 矩阵旋转，沿 z 轴旋转
    ///
    /// `angle` 是弧度制角度
    static func simd_rotateZ(_ node: SCNNode, angle: Float) {
        let matrix = SCNMatrix4(m11: cos(angle),  m12: sin(angle),  m13: 0, m14: 0,
                                m21: -sin(angle), m22: cos(angle),  m23: 0, m24: 0,
                                m31: 0,           m32: 0,           m33: 1, m34: 0,
                                m41: 0,           m42: 0,           m43: 0, m44: 1)
        let m = simd_float4x4(matrix)
        let trans = simd_mul(node.simdWorldTransform, m)
        node.simdWorldTransform = trans
    }
    
    /// SIMD 4x4 矩阵平移
    ///
    /// `translate` 三个参数分别代表 x、y、z 轴
    static func simd_translate(_ node: SCNNode, translate: float3) {
        let matrix = SCNMatrix4(m11: 1, m12: 0, m13: 0, m14: 0,
                                m21: 0, m22: 1, m23: 0, m24: 0,
                                m31: 0, m32: 0, m33: 1, m34: 0,
                                m41: Float(translate.x/1000),
                                m42: Float(translate.y/1000),
                                m43: Float(translate.z/1000),
                                m44: 1)
        
        let m = simd_float4x4(matrix)
        let trans = simd_mul(node.simdWorldTransform, m)
        node.simdWorldTransform = trans
    }
}
