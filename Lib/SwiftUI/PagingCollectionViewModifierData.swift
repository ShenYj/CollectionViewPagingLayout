//
//  PagingCollectionViewModifierData.swift
//  CollectionViewPagingLayout
//
//  Created by Amir Khorsandi on 10/04/2021.
//  Copyright © 2021 Amir Khorsandi. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
struct PagingCollectionViewModifierData {
    var scaleOptions: ScaleTransformViewOptions?
    var stackOptions: StackTransformViewOptions?
    var snapshotOptions: SnapshotTransformViewOptions?
    var numberOfVisibleItems: Int?
    var isPagingEnabled: Bool?
    var zPositionProvider: ((CGFloat) -> Int)?
    var animator: ViewAnimator?
    var goToSelectedPage: Bool?
    var collectionViewProperties: [CollectionViewPropertyProtocol] = []
    var onTapPage: ((Int) -> Void)?
    var scrollDirection: UICollectionView.ScrollDirection?
    var pagePadding: PagePadding?
}

@available(iOS 13.0, *)
protocol CollectionViewPropertyProtocol {
    func getKey<T>() -> WritableKeyPath<UICollectionView, T>?
    func getValue<T>() -> T?
}

@available(iOS 13.0, *)
struct CollectionViewProperty<T>: CollectionViewPropertyProtocol {
    let keyPath: WritableKeyPath<UICollectionView, T>
    let value: T

    func getKey<T>() -> WritableKeyPath<UICollectionView, T>? {
        keyPath as? WritableKeyPath<UICollectionView, T>
    }

    func getValue<T>() -> T? {
        value as? T
    }
}
