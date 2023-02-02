//
//  File.swift
//  
//
//  Created by Arturo Jamaica on 4/11/22.
//

import Foundation
import Solana

public class NftClient {
    let metaplex: Metaplex

    public init(metaplex: Metaplex) {
        self.metaplex = metaplex
    }

    public func findByMint(mintKey: PublicKey, onComplete: @escaping (Result<NFT, OperationError>) -> Void) {
        let operation = FindNftByMintOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftByMintOperation.pure(.success(mintKey))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findByMint(mintKey: PublicKey) async throws -> NFT {
        try await withCheckedThrowingContinuation { continuation in
            findByMint(mintKey: mintKey) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findByMetadata(_ metadata: PublicKey, onComplete: @escaping (Result<NFT, OperationError>) -> Void) {
        let operation = FindNftByMetadataOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftByMetadataOperation.pure(.success(metadata))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findByMetadata(metadata: PublicKey) async throws -> NFT {
        try await withCheckedThrowingContinuation { continuation in
            findByMetadata(metadata) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findByToken(address: PublicKey, onComplete: @escaping (Result<NFT, OperationError>) -> Void) {
        let operation = FindNftByTokenOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftByTokenOperation.pure(.success(address))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findByToken(address: PublicKey) async throws -> NFT {
        try await withCheckedThrowingContinuation { continuation in
            findByToken(address: address) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findAllByMintList(mintKeys: [PublicKey], onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        let operation = FindNftsByMintListOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftsByMintListOperation.pure(.success(mintKeys))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findAllByMintList(mintKeys: [PublicKey]) async throws -> [NFT?] {
        try await withCheckedThrowingContinuation { continuation in
            findAllByMintList(mintKeys: mintKeys) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findAllByCreator(creator: PublicKey, position: Int? = 1, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        let operation = FindNftsByCreatorOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftsByCreatorOperation.pure(.success(
            FindNftsByCreatorInput(
                creator: creator,
                position: position
            )))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findAllByCreator(creator: PublicKey, position: Int? = 1) async throws -> [NFT?] {
        try await withCheckedThrowingContinuation { continuation in
            findAllByCreator(creator: creator, position: position) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findAllByCandyMachine(candyMachine: PublicKey, version: UInt8? = 2, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        let operation = FindNftsByCandyMachineOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftsByCandyMachineOperation.pure(.success(
            FindNftsByCandyMachineInput(
                candyMachine: candyMachine,
                version: version
            )))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findAllByCandyMachine(candyMachine: PublicKey, version: UInt8? = 2) async throws -> [NFT?] {
        try await withCheckedThrowingContinuation { continuation in
            findAllByCandyMachine(candyMachine: candyMachine, version: version) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func findAllByOwner(publicKey: PublicKey, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        let operation = FindNftsByOwnerOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindNftsByOwnerOperation.pure(.success(publicKey))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func findAllByOwner(publicKey: PublicKey) async throws -> [NFT?] {
        try await withCheckedThrowingContinuation { continuation in
            findAllByOwner(publicKey: publicKey) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func createNft(input: CreateNftInput, onComplete: @escaping (Result<NFT, OperationError>) -> Void) {
        let operation = CreateNftOnChainOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: CreateNftOperation.pure(.success(input))).run { onComplete($0) }
    }
    
    @available(macOS 10.15, *)
    @available(iOS 13.0.0, *)
    func createNft(input: CreateNftInput) async throws -> NFT {
        try await withCheckedThrowingContinuation { continuation in
            createNft(input: input) { result in
                continuation.resume(with: result)
            }
        }
    }

    // MARK: - Deprecated

    @available(*, deprecated, renamed: "findByMint")
    public func findNftByMint(mintKey: PublicKey, onComplete: @escaping (Result<NFT, OperationError>) -> Void) {
        findByMint(mintKey: mintKey, onComplete: onComplete)
    }

    @available(*, deprecated, renamed: "findAllByMintList")
    public func findNftByMintList(mintKeys: [PublicKey], onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        findAllByMintList(mintKeys: mintKeys, onComplete: onComplete)
    }

    @available(*, deprecated, renamed: "findAllByCreator")
    public func findNftsByCreator(creator: PublicKey, position: Int? = 1, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        findAllByCreator(creator: creator, position: position, onComplete: onComplete)
    }

    @available(*, deprecated, renamed: "findAllByCandyMachine")
    public func findNftsByCandyMachine(candyMachine: PublicKey, version: UInt8? = 2, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        findAllByCandyMachine(candyMachine: candyMachine, version: version, onComplete: onComplete)
    }

    @available(*, deprecated, renamed: "findAllByOwner")
    public func findNftsByOwner(publicKey: PublicKey, onComplete: @escaping (Result<[NFT?], OperationError>) -> Void) {
        findAllByOwner(publicKey: publicKey, onComplete: onComplete)
    }
}
