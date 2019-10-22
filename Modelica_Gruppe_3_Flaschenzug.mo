package Modelica_Gruppe_3_Flaschenzug
  model Decke
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Aufhaengung annotation(
      Placement(visible = true, transformation(origin = {-10, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Aufhaengung.s = 0;
    annotation(
      Icon(graphics = {Rectangle(origin = {8, -89}, fillColor = {134, 134, 134}, fillPattern = FillPattern.Backward, extent = {{-94, 3}, {86, -3}})}, coordinateSystem(initialScale = 0.1)));
  end Decke;

  connector Port_F_s
    Real s(unit = "m") "Weg in [m]";
    flow Real F(unit = "N") "Kraft in [N]";
    annotation(
      Icon(graphics = {Rectangle(fillColor = {0, 0, 144}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(origin = {2, 1}, extent = {{-32, 15}, {32, -15}}, textString = "F<->s")}));
  end Port_F_s;

  model Rolle
    Port_F_s Lager_Rolle_1 annotation(
      Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_F_s port_Seil_input annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_F_s port_Seil_output annotation(
      Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    port_Seil_input.s + port_Seil_output.s = 2 * Lager_Rolle_1.s;
    port_Seil_input.F + port_Seil_output.F = Lager_Rolle_1.F;
    port_Seil_input.F = port_Seil_output.F;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {202, 202, 202}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Ellipse(origin = {6, -6}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {6, -6}}, endAngle = 360)}));
  end Rolle;

  model Masse
    Modelica_Gruppe_3_Flaschenzug.Port_F_s port_Masse annotation(
      Placement(visible = true, transformation(origin = {2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    constant Real g = 9.81 "Erdbeschleunigung in [m/s²]";
    parameter Real m = 1 "Masse in [kg]";
  equation
    port_Masse.F = m * g;
    annotation(
      Icon(graphics = {Polygon(origin = {0, -50}, fillPattern = FillPattern.Solid, points = {{-60, -30}, {60, -30}, {20, 30}, {-20, 30}, {-60, -30}}), Text(origin = {5, -55}, lineColor = {255, 255, 255}, extent = {{-35, 13}, {35, -13}}, textString = "Masse")}));
  end Masse;

  model Hand
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Zug_Hand_F_s annotation(
      Placement(visible = true, transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Zug_Hand_F_s.s = sin(time);
    annotation(
      Icon(graphics = {Ellipse(origin = {10, -20}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{-44, 22}, {38, -4}}, endAngle = 360), Ellipse(origin = {-30, 21}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {-4, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {14, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {32, 23}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360)}));
  end Hand;

  model Seil
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Seil_oben annotation(
      Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Seil_unten annotation(
      Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Seil_oben.s = Seil_unten.s;
    Seil_oben.F + Seil_unten.F = 0;
    annotation(
      Icon(graphics = {Rectangle(origin = {1, -1}, fillColor = {198, 159, 3}, fillPattern = FillPattern.Forward, extent = {{-5, 77}, {3, -75}})}));
  end Seil;

  connector Port_Electric
    Real u(unit = "V") "Spannung in [V]";
    flow Real i(unit = "A") "elektrischer Strom [A]";
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-80, 80}, {80, -80}}), Text(origin = {-1, 1}, extent = {{-73, 47}, {73, -47}}, textString = "Port_Electrical")}));
  end Port_Electric;

  model Steckdose
    constant Real PI = Modelica.Constants.pi;
    constant Real U_max(unit = "V") = 325.2691;
    //Spitzenspannung 325V bei 230V Effektiv
    Port_Electric port_Steckdose annotation(
      Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//port_Steckdose.u = U_max * sin(2 * PI * 50 * time);
    port_Steckdose.u = 15;
//Effektive Spannung 230V
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(extent = {{-60, 60}, {60, -60}}), Ellipse(extent = {{-40, 40}, {40, -40}}, endAngle = 360), Ellipse(origin = {-19, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {1, -1}, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {21, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Line(origin = {-37, 12}, points = {{-3, -8}, {3, -8}, {3, 8}, {3, 8}}), Line(origin = {-37, -12}, points = {{-3, 8}, {3, 8}, {3, -8}}), Line(origin = {37, 12}, points = {{3, -8}, {-3, -8}, {-3, 8}}), Line(origin = {37, -14}, points = {{3, 8}, {-3, 8}, {-3, -8}}), Rectangle(origin = {0, 35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}}), Rectangle(origin = {0, -35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}})}));
  end Steckdose;

  model E_Motor
    Real test;
  equation
    test = spule1.L;
  end E_Motor;

  model Spule
    Port_Electric port_Spule_I annotation(
      Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_Electric port_Spule_O annotation(
      Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Konstanten
    constant Real PI = Modelica.Constants.pi;
    //mechanische Parameter
    parameter Real l(unit = "m") = 20;
    parameter Real d(unit = "m") = 0.002;
    parameter Integer n(unit = "1") = 50;
    parameter Real A(unit = "m2");
    //elektrische Parameter
    parameter Real rho(unit = "Ohm.m") = 1.72e-2;
    parameter Real R(unit = "Ohm");
    //Variable Größen
    Real L(unit = "H");
  equation
    A = PI * d * d / 4;
    R = rho * l / A;
    L = port_Spule_I.u / der(port_Spule_I.i);
    annotation(
      Icon(graphics = {Line(origin = {-64, 0}, points = {{-24, 0}, {24, 0}, {24, 0}}, thickness = 0.75), Rectangle(fillPattern = FillPattern.Solid, extent = {{-40, 20}, {40, -20}}), Line(origin = {66, 0}, points = {{-26, 0}, {26, 0}}, thickness = 0.75), Text(origin = {1, 2}, lineColor = {255, 255, 255}, extent = {{-31, 16}, {31, -16}}, textString = "Spule")}, coordinateSystem(initialScale = 0.1)));
  end Spule;

  model GM_Reihenschluss
    Port_Electric port_E_Motor_I annotation(
      Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-42, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_Mechanic_rot port_E_Motor_O annotation(
      Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {34, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    constant Real PI = Modelica.Constants.pi;
    //Umbenennung Port Signale
    Real u(unit = "V");
    Real i(unit = "A");
    Real M_l(unit = "N.m");
    //elektrische Parameter
    parameter Real U_b(unit = "V") = 0;
    parameter Real R_a(unit = "Ohm") = 1.38;
    parameter Real R_fw(unit = "Ohm") = 0;
    parameter Real L_a(unit = "H") = 430e-6;
    parameter Real L_fw(unit = "H") = 0;
    parameter Real k_e(unit = "V.s") = 1.481e-4;
    Real u_a(unit = "V");
    //mechanische Parameter
    parameter Real J(unit = "kg.m2") = 1.71e-5;
    Real k_t(unit = "N.m/A");
    Real omega(unit = "rad/s");
    Real n(unit = "1/s");
    Real M_e(unit = "N.m");
  equation
//Gleichungen für Ports
    u = port_E_Motor_I.u;
    i = port_E_Motor_I.i;
    M_l = port_E_Motor_O.M;
    der(port_E_Motor_O.alpha) = omega;
    k_t = k_e / (2 * PI);
    n = 2 * PI * omega;
    u_a = -(2 * U_b + (R_a + R_fw) * i + (L_a + L_fw) * der(i) + k_e * n);
    J * der(omega) = M_e - M_l;
    M_e = k_t * i;
    u + u_a = 0;
    annotation(
      Icon(graphics = {Rectangle(origin = {-3, -1}, fillPattern = FillPattern.Solid, extent = {{-37, 35}, {37, -35}})}));
  end GM_Reihenschluss;

  connector Port_Mechanic_rot
    Real alpha(unit = "rad") "Drehwinkel in [rad]";
    flow Real M(unit = "N.m") "Drehmoment in [Nm]";
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-59, 60}, {61, -60}}), Text(origin = {1, 1}, extent = {{-55, 19}, {55, -19}}, textString = "Port_Mechanic_rot")}));
  end Port_Mechanic_rot;

  model Seilwinde
    Port_Mechanic_rot port_Mechanic_rot1 annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_F_s port_F_s1 annotation(
      Placement(visible = true, transformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter Real r(unit = "m") = 0.5 "Seilwindendurchmesser in [m]";
  equation
    port_Mechanic_rot1.alpha * r = port_F_s1.s;
    port_F_s1.F * r + port_Mechanic_rot1.M = 0;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {145, 145, 145}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Rectangle(origin = {43, 59}, fillColor = {221, 189, 6}, fillPattern = FillPattern.Backward, extent = {{-45, 1}, {45, -1}})}));
  end Seilwinde;

  model Flaschenzug_mit_Motor
  Modelica_Gruppe_3_Flaschenzug.Seil Seil1 annotation(
      Placement(visible = true, transformation(origin = {-10, 42}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle Rolle1 annotation(
      Placement(visible = true, transformation(origin = {4, 0}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil Seil2 annotation(
      Placement(visible = true, transformation(origin = {18, 42}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle Rolle2 annotation(
      Placement(visible = true, transformation(origin = {38, 70}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil Seil3 annotation(
      Placement(visible = true, transformation(origin = {56, 34}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.GM_Reihenschluss E_Motor annotation(
      Placement(visible = true, transformation(origin = {-13, -87}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Decke Decke1 annotation(
      Placement(visible = true, transformation(origin = {5, 153}, extent = {{-63, -63}, {63, 63}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seilwinde Seilwinde_1 annotation(
      Placement(visible = true, transformation(origin = {29, -87}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Masse Masse_1 annotation(
      Placement(visible = true, transformation(origin = {4, -30}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Steckdose Steckdose_1 annotation(
      Placement(visible = true, transformation(origin = {-68, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(E_Motor.port_E_Motor_I, Steckdose_1.port_Steckdose) annotation(
      Line(points = {{-26, -88}, {-68, -88}, {-68, -88}, {-68, -88}}));
    connect(Rolle1.Lager_Rolle_1, Masse_1.port_Masse) annotation(
      Line(points = {{4, 0}, {4, 0}, {4, -34}, {4, -34}}));
    connect(Seilwinde_1.port_F_s1, Seil3.Seil_unten) annotation(
      Line(points = {{50, -74}, {56, -74}, {56, 14}, {56, 14}}));
    connect(Seilwinde_1.port_Mechanic_rot1, E_Motor.port_E_Motor_O) annotation(
      Line(points = {{30, -88}, {-2, -88}, {-2, -88}, {-2, -88}}));
    connect(Rolle2.Lager_Rolle_1, Decke1.Aufhaengung) annotation(
      Line(points = {{38, 70}, {6, 70}, {6, 92}, {4, 92}}));
    connect(Seil1.Seil_oben, Decke1.Aufhaengung) annotation(
      Line(points = {{-10, 62}, {4, 62}, {4, 92}, {4, 92}}));
    connect(Rolle2.port_Seil_output, Seil3.Seil_oben) annotation(
      Line(points = {{52, 70}, {55, 70}, {55, 55}, {56, 55}}));
    connect(Seil2.Seil_oben, Rolle2.port_Seil_input) annotation(
      Line(points = {{18, 63}, {23.5, 63}, {23.5, 70}, {25, 70}}));
    connect(Rolle1.port_Seil_output, Seil2.Seil_unten) annotation(
      Line(points = {{18, 0}, {18, 21}}));
    connect(Seil1.Seil_unten, Rolle1.port_Seil_input) annotation(
      Line(points = {{-10, 21}, {-9, 21}, {-9, 0}}));
  end Flaschenzug_mit_Motor;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Modelica_Gruppe_3_Flaschenzug;
