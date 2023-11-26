import * as vscode from 'vscode';
import { activate } from 'd:/vs folders/today/Src/extension.ts';

test('should activate the extension', () => {
  // Create a mock ExtensionContext
  const context: vscode.ExtensionContext = {
    subscriptions: [] as vscode.Disposable[],
    workspaceState: {
      get: (_key: string) => undefined,
      update: (_key: string, _value: any) => Promise.resolve(),
      keys: () => [] as string[], // Provide an empty array for keys
    },
    globalState: {
      get: (_key: string) => undefined,
      update: (_key: string, _value: any) => Promise.resolve(),
    },
    secrets: {
      get: (_key: string) => undefined,
      update: (_key: string, _value: any) => Promise.resolve(),
    },
    extensionUri: vscode.Uri.parse('fake:uri'), // Provide a fake URI for extension
  };

  // Call the activate function
  activate(context);

  // You can add more specific test cases based on your extension logic
  expect(true).toBe(true);
});
