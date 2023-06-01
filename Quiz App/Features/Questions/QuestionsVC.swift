//
//  QuestionsVC.swift
//  Quiz App
//
//  Created by Ali Bamohammad on 23/05/2023.
//

import UIKit

class QuestionsVC: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var titleLable:UILabel!
    
    private var viewModel: QuestionsVMProtocol = QuestionsVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchQuestions()
        tableView.dataSource = self
        tableView.delegate = self
        setupUI()
    }
    
    func setupUI() {
        titleLable.text = viewModel.quetions[viewModel.curentQuitionIndex].title
    }
}

extension QuestionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quetions[viewModel.curentQuitionIndex].answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as UITableViewCell
        cell.textLabel?.text = viewModel.quetions[viewModel.curentQuitionIndex].answers[indexPath.row].title
        return cell
    }
}

extension QuestionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.checkIfCorrectAnswor(index: indexPath.row) else {
            showWrongAnswerAlert()
            return
        }

        if viewModel.checkIfLastQuestion() {
            showFinishAlert()
        } else {
            viewModel.moveToNextQuestion()
            setupUI()
            tableView.reloadData()
        }
    }
}

extension QuestionsVC {
    func showWrongAnswerAlert() {
        let alert = UIAlertController(title: "Opps!!", message: "Wrong Answer :(", preferredStyle: .alert)
        let dissimiss = UIAlertAction(title: "Dissmiss", style: .cancel)
        alert.addAction(dissimiss)
        present(alert, animated: true)
    }

    func showFinishAlert() {
        let alert = UIAlertController(title: "Did well", message: "You have finish the quize", preferredStyle: .alert)
        let dissimiss = UIAlertAction(title: "Dissmiss", style: .cancel)
        alert.addAction(dissimiss)
        present(alert, animated: true)
    }
}

extension QuestionsVC {
    static func creat(viewModel: QuestionsVMProtocol = QuestionsVM()) -> QuestionsVC {
        let vc = UIStoryboard.main.instantiateViewController(identifier: "QuestionsVC") as QuestionsVC
        vc.viewModel = viewModel
        return vc
    }
}

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}
