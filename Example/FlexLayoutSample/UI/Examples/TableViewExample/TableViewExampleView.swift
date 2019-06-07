// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Created by Luc Dion on 2017-07-17.

import UIKit

class TableViewExampleView: UIView {

    fileprivate let tableView = UITableView()
    fileprivate let methodCellTemplate = MethodCell()
    
    fileprivate var methods: [Method] = []
    
    init() {
        super.init(frame: .zero)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 10
        tableView.register(MethodCell.self, forCellReuseIdentifier: MethodCell.reuseIdentifier)
        tableView.register(MethodGroupHeader.self, forHeaderFooterViewReuseIdentifier: MethodGroupHeader.reuseIdentifier)
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(methods: [Method]) {
        self.methods = methods
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.pin.all()
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension TableViewExampleView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return MethodGroupHeader.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MethodGroupHeader.reuseIdentifier) as! MethodGroupHeader
        header.configure(title: "Flex container methods")
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodCell.reuseIdentifier, for: indexPath) as! MethodCell
        cell.configure(method: methods[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // The UITableView will call the cell's sizeThatFit() method to compute the height.
        // WANRING: You must also set the UITableView.estimatedRowHeight for this to work.
        return UITableView.automaticDimension
    }
}
