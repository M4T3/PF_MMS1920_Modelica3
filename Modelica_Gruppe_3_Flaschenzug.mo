package Modelica_Gruppe_3_Flaschenzug
  model Decke
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Aufhaengung annotation(
      Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0,-2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Aufhaengung.s = 0;
    annotation(
      Icon(graphics = {Rectangle(origin = {10, 5}, fillColor = {134, 134, 134}, fillPattern = FillPattern.Backward, extent = {{-94, 3}, {86, -3}})}, coordinateSystem(extent = {{-100, -20}, {100, 20}})),
      Diagram(coordinateSystem(extent = {{-100, -20}, {100, 20}})),
      __OpenModelica_commandLineOptions = "");
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
  port_Seil_input.F + port_Seil_output.F = -Lager_Rolle_1.F;
    port_Seil_input.F = port_Seil_output.F;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {202, 202, 202}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Ellipse(origin = {6, -6}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {6, -6}}, endAngle = 360)}, coordinateSystem(extent = {{-70, -70}, {70, 70}})),
      Diagram(coordinateSystem(extent = {{-70, -70}, {70, 70}})),
      __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
  end Rolle;

  model Masse
    Modelica_Gruppe_3_Flaschenzug.Port_F_s port_Masse annotation(
      Placement(visible = true, transformation(origin = {2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    constant Real g = 9.81 "Erdbeschleunigung in [m/s²]";
    parameter Real m= 1;
    Real s(unit = "m");
    Real v(unit = "m/s");
    Real a(unit = "m/s/s");
  equation
    a = der(v);
    v = der(s);
    s = port_Masse.s;
    port_Masse.F = m * a - m * g;
    annotation(
      Icon(graphics = {Polygon(origin = {0, -50}, fillPattern = FillPattern.Solid, points = {{-60, -30}, {60, -30}, {20, 30}, {-20, 30}, {-60, -30}}), Text(origin = {5, -55}, lineColor = {255, 255, 255}, extent = {{-35, 13}, {35, -13}}, textString = "Masse")}, coordinateSystem(extent = {{-60, -80}, {60, 0}})),
      Diagram(coordinateSystem(extent = {{-60, -80}, {60, 0}})),
      __OpenModelica_commandLineOptions = "");
  end Masse;

  model Hand
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Zug_Hand_F_s annotation(
      Placement(visible = true, transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Zug_Hand_F_s.F = -9;
    annotation(
      Icon(graphics = {Ellipse(origin = {10, -20}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{-44, 22}, {38, -4}}, endAngle = 360), Ellipse(origin = {-30, 21}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {-4, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {14, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {32, 23}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360)}, coordinateSystem(extent = {{-50, -40}, {50, 60}})),
      Diagram(coordinateSystem(extent = {{-50, -40}, {50, 60}})),
      __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
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
      Icon(graphics = {Rectangle(origin = {1, -1}, fillColor = {198, 159, 3}, fillPattern = FillPattern.Forward, extent = {{-5, 77}, {3, -75}})}, coordinateSystem(extent = {{-10, -100}, {10, 100}})),
      Diagram(coordinateSystem(extent = {{-10, -100}, {10, 100}})),
      __OpenModelica_commandLineOptions = "");
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
    parameter Real U_s(unit = "V") = 15;
    //Spitzenspannung 325V bei 230V Effektiv
    Port_Electric port_Steckdose annotation(
      Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//port_Steckdose.u = U_max * sin(2 * PI * 50 * time);
    port_Steckdose.u = U_s;
//Effektive Spannung 230V
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(extent = {{-60, 60}, {60, -60}}), Ellipse(extent = {{-40, 40}, {40, -40}}, endAngle = 360), Ellipse(origin = {-19, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {1, -1}, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {21, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Line(origin = {-37, 12}, points = {{-3, -8}, {3, -8}, {3, 8}, {3, 8}}), Line(origin = {-37, -12}, points = {{-3, 8}, {3, 8}, {3, -8}}), Line(origin = {37, 12}, points = {{3, -8}, {-3, -8}, {-3, 8}}), Line(origin = {37, -14}, points = {{3, 8}, {-3, 8}, {-3, -8}}), Rectangle(origin = {0, 35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}}), Rectangle(origin = {0, -35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}})}));
  end Steckdose;

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
      Icon(graphics = {Ellipse(fillColor = {145, 145, 145}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Rectangle(origin = {43, 59}, fillColor = {221, 189, 6}, fillPattern = FillPattern.Backward, extent = {{-45, 1}, {45, -1}})}, coordinateSystem(extent = {{-70, -70}, {100, 70}})),
      Diagram(coordinateSystem(extent = {{-70, -70}, {100, 70}})),
      __OpenModelica_commandLineOptions = "");
  end Seilwinde;

  model Flaschenzug_mit_Motor
  Modelica_Gruppe_3_Flaschenzug.Decke decke1 annotation(
      Placement(visible = true, transformation(origin = {7, 81.8}, extent = {{-81, -16.2}, {81, 16.2}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle rolle1 annotation(
      Placement(visible = true, transformation(origin = {8, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Masse masse1 annotation(
      Placement(visible = true, transformation(origin = {39.6855, -3.75273}, extent = {{-19.6855, -26.2473}, {19.6855, 0}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Hand hand1 annotation(
      Placement(visible = true, transformation(origin = {-43.43, -43.484}, extent = {{-19.57, -15.656}, {19.57, 23.484}}, rotation = 0)));
  equation
    connect(masse1.port_Masse, rolle1.port_Seil_output) annotation(
      Line(points = {{40, -16}, {22, -16}, {22, 40}, {22, 40}}));
    connect(rolle1.port_Seil_input, hand1.Zug_Hand_F_s) annotation(
      Line(points = {{-4, 40}, {-42, 40}, {-42, -44}, {-42, -44}}));
    connect(decke1.Aufhaengung, rolle1.Lager_Rolle_1) annotation(
      Line(points = {{6, 80}, {8, 80}, {8, 40}, {8, 40}}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.0001),
      Diagram);end Flaschenzug_mit_Motor;

  model Einfaches_Modell
    Modelica_Gruppe_3_Flaschenzug.Decke decke1 annotation(
      Placement(visible = true, transformation(origin = {-1, 79}, extent = {{-67, -67}, {67, 67}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {0, 46}, extent = {{-3, -30}, {3, 30}}, rotation = 0)));
  equation

  end Einfaches_Modell;

  model GM_Nebenschluss
    Port_Electric port_Electric_Anker annotation(
      Placement(visible = true, transformation(origin = {-58, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-58, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_Electric port_Electric_Erreger annotation(
      Placement(visible = true, transformation(origin = {-58, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_Mechanic_rot port_Mechanic annotation(
      Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //---------------------------
    //Port Variablen
    Real u_a(unit = "V");
    Real u_fw(unit = "V");
    Real i_a(unit = "A");
    Real i_fw(unit = "A");
    Real alpha(unit = "rad");
    //---------------------------
    //Parameter elektrisch
    parameter Real U_b(unit = "V") = 0;
    parameter Real R_a(unit = "Ohm") = 0.04;
    parameter Real R_aV(unit = "Ohm") = 1;
    parameter Real R_fw(unit = "Ohm") = 17;
    parameter Real R_fwV(unit = "Ohm") = 1;
    parameter Real L_a(unit = "H") = 400e-6;
    parameter Real L_fw(unit = "H") = 7.5;
    //---------------------------
    //Variablen elektrisch
    Real k_e(unit = "V.s");
    Real k_t(unit = "N.m/A");
    //---------------------------
    //Parameter mechanisch
    parameter Real J(unit = "kg.m2") = 10e-2;
    //---------------------------
    //Variablen mechanisch
    Real omega(unit = "rad/s");
    Real n(unit = "1/s");
    Real M_l(unit = "N.m");
    Real M_e(unit = "N.m");
    //---------------------------
    //Konstanten
    constant Real PI = Modelica.Constants.pi;
  equation
    k_e = 1 / (1 + exp(-0.28 * i_fw)) - 0.5 + 0.004 * i_fw;
    k_t = k_e / (2 * PI);
    omega = der(alpha);
    n = 2 * PI * omega;
    alpha = port_Mechanic.alpha;
    i_a = port_Electric_Anker.i;
    u_a = port_Electric_Anker.u;
    i_fw = port_Electric_Erreger.i;
    u_fw = port_Electric_Erreger.u;
    M_l = port_Mechanic.M;
    u_a = 2 * U_b + (R_a + R_aV) * i_a + L_a * der(i_a) + k_e * n;
    u_fw = (R_fw + R_fwV) * i_fw + L_fw * der(i_fw);
    J * der(omega) = M_e - M_l;
    M_e = k_t * i_a;
    annotation(
      Icon(graphics = {Rectangle(fillColor = {144, 144, 144}, fillPattern = FillPattern.Solid, extent = {{-60, 40}, {60, -40}})}, coordinateSystem(extent = {{-80, -50}, {80, 50}})),
      Diagram(coordinateSystem(extent = {{-80, -50}, {80, 50}})),
      __OpenModelica_commandLineOptions = "");
  end GM_Nebenschluss;

  model Test_Motor
    Modelica_Gruppe_3_Flaschenzug.GM_Nebenschluss gM_Nebenschluss1 annotation(
      Placement(visible = true, transformation(origin = {-16, 2}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Steckdose steckdose_Anker(U_s = 42) annotation(
      Placement(visible = true, transformation(origin = {-82, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Steckdose steckdose_Erreger(U_s = 300) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Last_rotatorisch last_rotatorisch1 annotation(
      Placement(visible = true, transformation(origin = {67, 1}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  equation
  connect(steckdose_Anker.port_Steckdose, gM_Nebenschluss1.port_Electric_Anker) annotation(
      Line(points = {{-82, 14}, {-58, 14}, {-58, 13.8}, {-36, 13.8}, {-36, 9.8}}));
  connect(last_rotatorisch1.port_Mechanic_Last, gM_Nebenschluss1.port_Mechanic) annotation(
      Line(points = {{68, 1}, {3.94274, 1}, {3.94274, 1.5}, {1.94274, 1.5}, {1.94274, 2}}));
  connect(steckdose_Erreger.port_Steckdose, gM_Nebenschluss1.port_Electric_Erreger) annotation(
      Line(points = {{-80, -12.2}, {-59, -12.2}, {-59, -10.2}, {-38, -10.2}, {-38, -2.2}, {-37, -2.2}, {-37, -4.2}, {-36, -4.2}}));
  end Test_Motor;

  model Last_rotatorisch
    Modelica_Gruppe_3_Flaschenzug.Port_Mechanic_rot port_Mechanic_Last annotation(
      Placement(visible = true, transformation(origin = {6, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    if time < 5 then
      port_Mechanic_Last.M = 0;
    else
      port_Mechanic_Last.M = -2;
    end if;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {185, 5, 5}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-60, 60}, {60, -60}}, endAngle = 360)}, coordinateSystem(extent = {{-70, -70}, {70, 70}})),
      Diagram(coordinateSystem(extent = {{-70, -70}, {70, 70}})),
      __OpenModelica_commandLineOptions = "");
  end Last_rotatorisch;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Modelica_Gruppe_3_Flaschenzug;
