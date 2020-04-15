//
//  ImageViewController.swift
//  Machine Learning Image
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ImageViewController: UIViewController {

    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func makePredictionFor(_ image: UIImage){
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else { return }
        let request = VNCoreMLRequest(model: model, completionHandler: handleResults)
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        
        do {
            try handler.perform([request])
        }catch {
            debugPrint(error)
        }
    }
    
    func handleResults(request: VNRequest, error: Error?){
        guard let results = request.results as? [VNClassificationObservation] else { return }
        let confidence = String.init(format: "%.2f", results[0].confidence * 100)
        classificationLabel.text = "Most likely: \(results[0].identifier) || Confidence: \(confidence) %"
        
    }
}

extension ImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell else { return }
        makePredictionFor(cell.imageView.image!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        let image = imageList[indexPath.row]
        cell.configureCell(image)
        return cell
    }
}
