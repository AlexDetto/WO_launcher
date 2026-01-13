Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, System.IO, System.Xml, System.Diagnostics;

const
  local = 0; // 0 - Rus, 1 - Eng

var
  // Локализация UI
  button_close := ('Закрыть', 'Close');
  button_play := ('Играть', 'Play');
  button_info := ('Инфо', 'Info');
  check_start_server := ('Запустить сервер', 'Auto-start server');
  check_custom_port := ('Нестандартный порт', 'Specify custom port');
  
  // Локализация окон сообщений
  info_title := ('Информация', 'Information');
  info_msg := ('Данный лаунчер создан пользователем под ником Kornill.'#13#10#13#10'Лаунчер является НАДСТРОЙКОЙ для более удобного запуска и управления модом WitcherOnline от rejuvenate7.'#13#10#13#10'Спасибо ему большое за мод!', 'This launcher was created by a user with the nickname Kornill.'#13#10#13#10'The launcher is an ADD-ON for easier launching and management of the WitcherOnline mod by rejuvenate7.'#13#10#13#10'Thank you very much to him for the mod!');
  check_start_server_title := ('Запуск сервера', 'Auto-start server');
  check_start_server_msg := ('Поставив данную галочку приложение автоматически запустит сервер вместе с запуском самой игры.'#13#10#13#10'Также, если галочка поставленна, у вас пропадёт возможность ввести IP-адрес для подключения так как вы сами будете являться хостом.'#13#10#13#10'Администрирование сервера происходит путём ввода команд в консоль сервера. Введите help в консоль сервера чтобы увидеть все доступные команды. Их там не много.', 'By checking this box, the application will automatically start the server along with the game.'#13#10#13#10'Also, if the checkbox is checked, you will lose the ability to enter an IP address for connection, as you will be the host yourself.'#13#10#13#10'Server administration is done by entering commands in the server console. Type "help" in the server console to see all available commands. There are not many of them.');
  check_custom_port_title := ('Нестандартный порт', 'Specify custom port');
  check_custom_port_msg := ('Поставте галочку, если надо использовать нестандартный порт.'#13#10#13#10'Учтите, если у вас также соит галочка для запуска сервера, то сервер запустится с заданным вами портом.', 'Check this box if you need to use a custom port.'#13#10#13#10'Note that if you also have the checkbox to start the server enabled, the server will start on the port you specify.');
  
  // Локализация окна выбора папки игры
  descript := ('Выберите корневую папку с игрой The Witcher 3', 'Select the root folder of The Witcher 3 game.');
  folder_select_error_title := ('Ошибка выбора папки', 'Folder selection error');
  folder_select_error_msg := ('Выбранная папка не является корневой папкой The Witcher 3'#13#10'Пожалуйста, выберите КОРНЕВУЮ папку игры', 'The selected folder is not the root folder of The Witcher 3'#13#10'Please select the games ROOT folder');
type
  Form1 = class(Form)
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure button3_Click(sender: Object; e: EventArgs);
    procedure checkBox1_CheckedChanged(sender: Object; e: EventArgs);
    procedure label2_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure Form1_Load(sender: Object; e: EventArgs); // Добавили событие загрузки формы
    procedure SelectGameFolderAndUpdateLabel(); // Запрос папки с игрой
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure checkBox2_CheckedChanged(sender: Object; e: EventArgs);
    procedure button5_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal
    {$resource Unit1.Form1.resources}
    textBox1: TextBox;
    label1: &Label;
    button1: Button;
    button2: Button;
    label2: &Label;
    textBox2: TextBox;
    checkBox1: CheckBox;
    button4: Button;
    comboBox1: ComboBox;
    label3: &Label;
    checkBox2: CheckBox;
    textBox3: TextBox;
    label4: &Label;
    button5: Button;
    button3: Button;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
      // Подписываемся на событие загрузки формы
      Self.Load += Form1_Load;
    end;
    
  private
    procedure LoadConfigFromXML; // Добавили метод загрузки настроек
  end;

implementation

// Процедура загрузки настроек из XML
procedure Form1.LoadConfigFromXML;
var
  appDataPath, configPath, clientconfigPath: string;
  xmlDoc, xmlDoc2: XmlDocument;
  dxNode, usernameNode, serverIPNode, gamedirNode, portNode: XmlNode;
begin
  button1.Text := button_play[local];
  button2.Text := button_close[local];
  button3.Text := button_info[local];
  checkBox1.Text := check_start_server[local];
  checkBox2.Text := check_custom_port[local];
  try
    // Получаем путь к папке AppData текущего пользователя
    appDataPath := Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
    
    // Формируем полный путь к файлу config.xml
    configPath := Path.Combine(appDataPath, 'WitcherAppKornill', 'config.xml');
    
    if not FileExists(configPath) then
      begin
      SelectGameFolderAndUpdateLabel;
      System.Threading.Thread.Sleep(2000);
      end;
    
    begin
      // Создаем XML документ
      xmlDoc := new XmlDocument;
      
      // Загружаем XML файл
      xmlDoc.Load(configPath);
      
      // Получаем значение DX
      dxNode := xmlDoc.SelectSingleNode('/Config/DX');
      if dxNode <> nil then
        if dxNode.InnerText = '11' then
          comboBox1.SelectedIndex := 0
        else if dxNode.InnerText = '12' then
          comboBox1.SelectedIndex := 1;
      
      // Получаем значение GameDir
      gamedirNode := xmlDoc.SelectSingleNode('/Config/GameDir');
      if gamedirNode <> nil then
        label3.Text := gamedirNode.InnerText;
      
      // Формируем полный путь к файлу клиентского конфига
      clientconfigPath := Path.Combine(gamedirNode.InnerText, 'bin\WitcherOnline', 'config.xml');
      
      // Создаем XML документ
      xmlDoc2 := new XmlDocument;
      
      // Загружаем XML файл
      xmlDoc2.Load(clientconfigPath);
      
      // Получаем значение Username
      usernameNode := xmlDoc2.SelectSingleNode('/Config/Username');
      if usernameNode <> nil then
        textBox1.Text := usernameNode.InnerText;
      
      // Получаем значение ServerIP
      serverIPNode := xmlDoc2.SelectSingleNode('/Config/ServerIP');
      if serverIPNode <> nil then
        textBox2.Text := serverIPNode.InnerText;
      
      // Получаем значение Port
      portNode := xmlDoc2.SelectSingleNode('/Config/Port');
      if portNode <> nil then
        textBox3.Text := portNode.InnerText;
    end
    
  except
    on ex: Exception do
    begin
      // Обработка ошибок при чтении файла
      // Можно вывести сообщение об ошибке
      MessageBox.Show('Error loading settings:'#13#10 + ex.Message, 
        'Error', MessageBoxButtons.OK, MessageBoxIcon.Warning);
      //SelectGameFolderAndUpdateLabel;
      //LoadConfigFromXML;
    end;
  end;
end;

// Выбор папки с игрой, если не был найден конфиг лаунчера
procedure Form1.SelectGameFolderAndUpdateLabel;
var
  appDataPath, configfolderPath, configPath: string;
  xmlDoc: XmlDocument;
  root, DX, GameDir: XmlElement;
  xmlDecl: XmlDeclaration;
begin
  var dialog := new FolderBrowserDialog();
  dialog.Description := descript[local];
  dialog.ShowNewFolderButton := false;
  
  appDataPath := Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
  configfolderPath := Path.Combine(appDataPath, 'WitcherAppKornill');
  configPath := Path.Combine(configfolderPath, 'config.xml');
  
  while true do
  begin
    if dialog.ShowDialog() = System.Windows.Forms.DialogResult.OK then
    begin
      var gamePath := dialog.SelectedPath;
      var exePath := Path.Combine(gamePath, 'bin', 'x64', 'witcher3.exe');
      
      if System.IO.File.Exists(exePath) then
      begin
        label3.Text := gamePath;
          if not Directory.Exists(configfolderPath) then
          begin
            Directory.CreateDirectory(configfolderPath);
            // Создаем XML документ
            xmlDoc := new XmlDocument;
            
            // Добавляем декларацию XML
            xmlDecl := xmlDoc.CreateXmlDeclaration('1.0', 'utf-8', nil);
            xmlDoc.AppendChild(xmlDecl);
            
            // Создаем корневой элемент
            root := xmlDoc.CreateElement('Config');
            xmlDoc.AppendChild(root);
            
            // Создаем элемент DX
            DX := xmlDoc.CreateElement('DX');
            DX.InnerText := '11';
            root.AppendChild(DX);
            
            // Создаем элемент GameDir
            GameDir := xmlDoc.CreateElement('GameDir');
            GameDir.InnerText := gamePath;
            root.AppendChild(GameDir);
            
            // Сохраняем файл
            xmlDoc.Save(configPath);
            break;
          end
          else
          begin
            // Создаем XML документ
            xmlDoc := new XmlDocument;
            
            // Добавляем декларацию XML
            xmlDecl := xmlDoc.CreateXmlDeclaration('1.0', 'utf-8', nil);
            xmlDoc.AppendChild(xmlDecl);
            
            // Создаем корневой элемент
            root := xmlDoc.CreateElement('Config');
            xmlDoc.AppendChild(root);
            
            // Создаем элемент DX
            DX := xmlDoc.CreateElement('DX');
            DX.InnerText := '11';
            root.AppendChild(DX);
            
            // Создаем элемент GameDir
            GameDir := xmlDoc.CreateElement('GameDir');
            GameDir.InnerText := gamePath;
            root.AppendChild(GameDir);
            
            // Сохраняем файл
            xmlDoc.Save(configPath);
            break;
        end;
      end
      else
      begin
        MessageBox.Show(folder_select_error_msg[local], folder_select_error_title[local], MessageBoxButtons.OK, MessageBoxIcon.Warning);
      end;
    end
    else
    begin
      Close;
    end;
  end;
end;

// Обработчик загрузки формы
procedure Form1.Form1_Load(sender: Object; e: EventArgs);
begin
  // Загружаем настройки из XML при загрузке формы
  LoadConfigFromXML;
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  Close;
end;

procedure Form1.button3_Click(sender: Object; e: EventArgs);
begin
  MessageBox.Show(info_msg[local], info_title[local]);
end;

procedure Form1.checkBox1_CheckedChanged(sender: Object; e: EventArgs);
begin
  TextBox2.Enabled := not CheckBox1.Checked;
end;

procedure Form1.label2_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  MessageBox.Show(check_start_server_msg[local], check_start_server_title[local]);
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
var
  Game, Server, appDataPath, configPath, clientconfigPath, serverconfigPath: string;
  xmlDoc, xmlDoc2: XmlDocument;
  root, root2, DX, username, serverIP, GameDir, port, firstload: XmlElement;
  xmlDecl, xmlDecl2: XmlDeclaration;
  psi: ProcessStartInfo;
  f: TextFile;
  lines: array of string;
begin
  try
    // Получаем путь до файла конфига лаунчера
    appDataPath := Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
    configPath := Path.Combine(appDataPath, 'WitcherAppKornill', 'config.xml');
    
    // Создаем XML документ
    xmlDoc := new XmlDocument;
    
    // Добавляем декларацию XML
    xmlDecl := xmlDoc.CreateXmlDeclaration('1.0', 'utf-8', nil);
    xmlDoc.AppendChild(xmlDecl);
    
    // Создаем корневой элемент
    root := xmlDoc.CreateElement('Config');
    xmlDoc.AppendChild(root);
    
    // Создаем элемент DX
    DX := xmlDoc.CreateElement('DX');
    if comboBox1.Text = 'DirectX 11' then
      DX.InnerText := '11'
    else if comboBox1.Text = 'DirectX 12' then
      DX.InnerText := '12';
    root.AppendChild(DX);
    
    // Создаем элемент GameDir
    GameDir := xmlDoc.CreateElement('GameDir');
    GameDir.InnerText := label3.Text;
    root.AppendChild(GameDir);
    
    // Сохраняем файл
    xmlDoc.Save(configPath);
    
    // Получаем путь до папки игры
    clientconfigPath := Path.Combine(label3.Text, 'bin\WitcherOnline', 'config.xml');
    
    // Создаем XML документ
    xmlDoc2 := new XmlDocument;
    
    // Добавляем декларацию XML
    xmlDecl2 := xmlDoc2.CreateXmlDeclaration('1.0', 'utf-8', nil);
    xmlDoc2.AppendChild(xmlDecl2);
    
    // Создаем корневой элемент
    root2 := xmlDoc2.CreateElement('Config');
    xmlDoc2.AppendChild(root2);
    
     // Создаем элемент Username
    username := xmlDoc2.CreateElement('Username');
    username.InnerText := textBox1.Text;
    root2.AppendChild(username);
    
    // Создаем элемент ServerIP
    serverIP := xmlDoc2.CreateElement('ServerIP');
    if CheckBox1.Checked then
      serverIP.InnerText := '127.0.0.1'
    else
      serverIP.InnerText := textBox2.Text;
    root2.AppendChild(serverIP);
    
    // Создаем элемент Port
    port := xmlDoc2.CreateElement('Port');
    if CheckBox2.Checked then
      port.InnerText := textBox3.Text
    else
      port.InnerText := '40000';
    root2.AppendChild(port);
    
    // Создаем элемент firstload
    firstload := xmlDoc2.CreateElement('FirstLoad');
    firstload.InnerText := 'false';
    root2.AppendChild(firstload);
    
    // Сохраняем файл
    xmlDoc2.Save(clientconfigPath);
    
    // Запуск сервера
    if CheckBox1.Checked then
    begin
      // Получаем путь до файла конфига сервера
      serverconfigPath := Path.Combine(label3.Text, 'Server', 'server.properties');
      
      if CheckBox2.Checked then
      begin      
        // Читаем файл
        AssignFile(f, serverconfigPath);
        Reset(f);
        while not Eof(f) do begin
          SetLength(lines, Length(lines) + 1);
          Readln(f, lines[High(lines)]);
        end;
        CloseFile(f);
        
        // Ищем и заменяем порт
        for var i := 0 to High(lines) do
          if Copy(lines[i], 1, 5) = 'port=' then
            lines[i] := 'port=' + textBox3.Text;
          
        // Записываем обратно
        Rewrite(f);
        for var i := 0 to High(lines) do
          Writeln(f, lines[i]);
        CloseFile(f);
      end
      else
        begin
        // Читаем файл
        AssignFile(f, serverconfigPath);
        Reset(f);
        while not Eof(f) do begin
          SetLength(lines, Length(lines) + 1);
          Readln(f, lines[High(lines)]);
        end;
        CloseFile(f);
        
        // Ищем и заменяем порт
        for var i := 0 to High(lines) do
          if Copy(lines[i], 1, 5) = 'port=' then
            lines[i] := 'port=' + '40000';
          
        // Записываем обратно
        Rewrite(f);
        for var i := 0 to High(lines) do
          Writeln(f, lines[i]);
        CloseFile(f);
        end;
      Server := Path.Combine(label3.Text, 'Server', 'WitcherOnlineServer.exe');
      Process.Start(Server);
      end;
    
    
    // Запуск
    if comboBox1.Text = 'DirectX 12' then
      Game := Path.Combine(label3.Text, 'bin\x64_dx12', 'witcher3.exe')
    else
      Game := Path.Combine(label3.Text, 'bin\x64', 'witcher3.exe');
    
    psi := new ProcessStartInfo;
    psi.FileName := Game;
    psi.Arguments := '-net -debugscripts';
    psi.WorkingDirectory := Path.GetDirectoryName(Game);
    psi.UseShellExecute := True;
    psi.WindowStyle := ProcessWindowStyle.Normal;
    
    Process.Start(psi);
    
  except
    on ex: Exception do
      MessageBox.Show('Startup error:'#13#10 + ex.Message, 
        'Error', MessageBoxButtons.OK, MessageBoxIcon.Error);
  end;
end;

procedure Form1.checkBox2_CheckedChanged(sender: Object; e: EventArgs);
begin
  TextBox3.Enabled := CheckBox2.Checked;
end;

procedure Form1.button5_Click(sender: Object; e: EventArgs);
begin
  MessageBox.Show(check_custom_port_msg[local], check_custom_port_title[local]);
end;

end.
