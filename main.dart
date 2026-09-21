import 'dart:io';

void main() {
  print('===== СИСТЕМА ПРОВЕРКИ ПОЛЬЗОВАТЕЛЯ =====');

  // =========================
  // 1. ВВОД ДАННЫХ
  // =========================

  stdout.write('Введите имя: ');
  String name = stdin.readLineSync()!;

  stdout.write('Введите возраст: ');
  int age = int.parse(stdin.readLineSync()!);

  stdout.write('Введите логин: ');
  String login = stdin.readLineSync()!;

  stdout.write('Введите пароль: ');
  String password = stdin.readLineSync()!;

  stdout.write(
    'Введите роль (1 — пользователь, 2 — администратор, 3 — гость): ',
  );
  int role = int.parse(stdin.readLineSync()!);

  stdout.write('Аккаунт подтверждён? (true/false): ');
  bool isConfirmed = stdin.readLineSync()!.toLowerCase() == 'true';

  // =========================
  // 2. ПРОВЕРКА ВОЗРАСТА
  // if - else if - else
  // =========================

  String ageResult;

  if (age < 13) {
    ageResult = 'доступ запрещён: слишком маленький возраст';
    print('Доступ запрещён: слишком маленький возраст');
  } else if (age >= 13 && age <= 17) {
    ageResult = 'доступ ограничен';
    print('Доступ ограничен');
  } else if (age >= 18 && age <= 59) {
    ageResult = 'полный доступ';
    print('Полный доступ');
  } else {
    ageResult = 'доступ разрешён';
    print('Доступ разрешён');
  }

  // =========================
  // 3. ПРОВЕРКА АККАУНТА
  // Обычный if
  // =========================

  if (isConfirmed) {
    print('Аккаунт подтверждён');
  }

  // =========================
  // 4. БУЛЕВАЯ АЛГЕБРА
  // =========================

  // && AND:
  // возраст >= 18 И аккаунт подтверждён
  bool fullAccess = age >= 18 && isConfirmed;

  // Правильные данные для входа
  String correctLogin = 'admin';
  String correctPassword = '12345';

  // && AND:
  // логин правильный И пароль правильный
  bool loginSuccess = login == correctLogin && password == correctPassword;

  // || OR:
  // администратор ИЛИ возраст >= 18
  bool isAdmin = role == 2;
  bool specialAccess = isAdmin || age >= 18;

  // ! NOT:
  // аккаунт НЕ подтверждён
  if (!isConfirmed) {
    print('Аккаунт не подтверждён');
  }

  // =========================
  // 5. ПРОВЕРКА ЛОГИНА И ПАРОЛЯ
  // if - else
  // =========================

  if (loginSuccess) {
    print('Вход выполнен успешно');
  } else {
    print('Неверный логин или пароль');
  }

  // =========================
  // 6. ПРОВЕРКА РОЛИ
  // switch + default
  // =========================

  String roleName;

  switch (role) {
    case 1:
      roleName = 'Обычный пользователь';
      print('Вы вошли как обычный пользователь');
      break;

    case 2:
      roleName = 'Администратор';
      print('Вы вошли как администратор');
      break;

    case 3:
      roleName = 'Гость';
      print('Вы вошли как гость');
      break;

    default:
      roleName = 'Неизвестная роль';
      print('Неизвестная роль');
  }

  // =========================
  // 7. ИТОГОВЫЙ ДОСТУП
  // =========================

  bool systemAccess = fullAccess && loginSuccess;

  // =========================
  // 8. ИТОГОВЫЙ РЕЗУЛЬТАТ
  // =========================

  print('');
  print('===== РЕЗУЛЬТАТ ПРОВЕРКИ =====');

  print('Имя: $name');
  print('Возраст: $age');
  print('Роль: $roleName');
  print('Аккаунт: ${isConfirmed ? 'подтверждён' : 'не подтверждён'}');

  print('');
  print('Возраст: $ageResult');
  print('Логин и пароль: ${loginSuccess ? 'успешно' : 'ошибка'}');
  print('Доступ к системе: ${systemAccess ? 'разрешён' : 'запрещён'}');
  print('Специальный доступ: ${specialAccess ? 'разрешён' : 'запрещён'}');
}
