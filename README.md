# Visual Studio Code Remote - Containersセットアップ手順

## Docker Compose
---

### テンプレート準備
* GitHubから持ってくる
```
$ mkdir プロジェクト名
$ git clone https://github.com/yoshio-suzuki/vscode_template.git プロジェクト名
```

### Dockerfile修正
* プロジェクトに合わせる(Pythonバージョンや追加パッケージ等)
```
$ vim プロジェクト名/app/Dockerfile
```

### docker-compose.yml追加設定
* Web/DBと連携するアプリを作成する場合は、そのサービスも起動するように設定する
```
$ vim プロジェクト名/docker-compose.yml
```

### Dockerコンテナ起動
* `docker-compose`を実行できる環境は事前準備しておくこと
```
$ cd プロジェクト名
$ docker-compose up -d
```

## (参考)Docker操作
---

### コンテナ停止
* ボリュームも消す場合は`-v`オプションを追加する
```
$ cd プロジェクト名
$ docker-compose down
```

### コンテナ状態
```
$ cd プロジェクト名
$ docker-compose ps
$ docker-compose logs -f サービス名
```

### イメージ再構築
* Dockerfileを修正した場合は、手動で再構築が必要
```
$ cd プロジェクト名
$ docker-compose build サービス名
```

### 不要コンテナ・イメージ・ボリューム等削除
```
$ docker system prune --volumes
```

## Visual Studio Code
---

### 初期設定(初回のみ)
* Extensionsから下記追加
    * Remote - Containers
    * 個人的にVim

* bashターミナルとvim向けショットカット設定
    * File > Preferences > Keyboard Shortcuts > Open Keyboard Shortcuts(JSON)からkeybindings.jsonを編集
```json
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "ctrl+p",
        "command": "-workbench.action.quickOpen"
    },
    {
        "key": "ctrl+e",
        "command": "-workbench.action.quickOpen"
    },
    {
        "key": "ctrl+m",
        "command": "-editor.action.toggleTabFocusMode"
    },
    {
        "key": "ctrl+f",
        "command": "-workbench.action.terminal.focusFindWidget",
    },
    {
        "key": "ctrl+shift+c",
        "command": "extension.vim_ctrl+c",
        "when": "editorTextFocus && vim.active && vim.overrideCtrlC && vim.use<C-c> && !inDebugRepl"
    },
    {
        "key": "ctrl+shift+v",
        "command": "extension.vim_ctrl+v",
        "when": "editorTextFocus && vim.active && vim.use<C-v> && !inDebugRepl"
    }
]
```

### コンテナ別設定
* コンテナ接続
    * 画面左下の緑色の部分をクリック > Remote-Containers: Attach to Running Container... > 対象のDockerコンテナを選ぶ
    * 新しいウィンドウが開く

* プロジェクトフォルダを開く
    * Explorer > Open Folderから、/root/code/を開く

* Extensionsから下記追加
    * Python

* コンテナ用シェル設定
    * コンテナでターミナルを開くとbashではなくshになってしまう対処（そのうち修正されるかも）
    * Settingsの『**Remote[Attached Container ...]側**』で、terminal.integrated.shell.linux: /bin/bashに設定
    * Edit in settings.jsonから設定

```json
{
    "terminal.integrated.shell.linux": "/bin/bash"
}
```

## 新規プロジェクトの場合
---

### 環境構築
* Terminalを開く
* pythonバージョンはプロジェクトに合わせる
```
# pipenv --python 3.7
```
* .venv、Pipfileができる

### 各種モジュール追加
* Terminalを開く
```
# pipenv install jupyter opencv-python matplotlib
```

### サンプル
* 適当な画像ダウンロード
```
# wget http://www.lenna.org/lena_std.tif
```

* 画像表示
* Pythonエクステンションのリロードが必要かも
```python
#%%
import cv2
im = cv2.imread('./lena_std.tif')
print(im.shape, type(im))
```

```python
#%%
import matplotlib.pyplot as plt
%matplotlib inline

plt.figure(dpi=50)
plt.imshow(cv2.cvtColor(im, cv2.COLOR_BGR2RGB))
plt.show()
```

## プロジェクトインポートの場合
---

### プロジェクトインポート
* Terminalを開く
* `git config --global user.{email,name}`による事前設定が必要
* Pipfile.lockの有無によって、`pipenv sync`するか`pipenv install`するか判断する
```
$ git clone https://github.com/プロジェクト名.git /root/code
$ cd /root/code
$ pipenv sync
```

## Git管理
---

### 初期化
* Source Control > Initialize Repository > code選択

### .gitignore
* .gitignoreファイル作成
```
.venv
.vscode
```

### その他
* ターミナルからgitコマンド操作したほうが楽か?
