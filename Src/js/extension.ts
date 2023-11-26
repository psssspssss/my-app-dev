// extension.ts
import * as vscode from 'vscode';

function activate(context: vscode.ExtensionContext) {
    console.log('Your extension is now active!');

    // Your extension logic here...

    // Register a command
    const disposable = vscode.commands.registerCommand('yourExtension.sayHello', () => {
        vscode.window.showInformationMessage('Hello from Your Extension!');
    });

    context.subscriptions.push(disposable);
}

function deactivate() {
    console.log('Your extension is now deactivated.');
}

export {
    activate,
    deactivate
};
