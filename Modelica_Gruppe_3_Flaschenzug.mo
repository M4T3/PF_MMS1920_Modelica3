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
    Real s "Weg in [m]";
    flow Real F "Kraft in [N]";
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
    port_Seil_input.s + port_Seil_output.s = 2 *Lager_Rolle_1.s;
    port_Seil_input.F + port_Seil_output.F = Lager_Rolle_1.F;
    port_Seil_input.F = port_Seil_output.F;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {202, 202, 202}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Ellipse(origin = {6, -6}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {6, -6}}, endAngle = 360)}));
  end Rolle;

  model Flaschenzug
    Modelica_Gruppe_3_Flaschenzug.Rolle Rolle1 annotation(
      Placement(visible = true, transformation(origin = {0, 66}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Hand hand1 annotation(
      Placement(visible = true, transformation(origin = {-55, -49}, extent = {{-45, -45}, {45, 45}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Masse masse1 annotation(
      Placement(visible = true, transformation(origin = {25, -23}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Decke Decke1 annotation(
      Placement(visible = true, transformation(origin = {0, 132}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Seil Seil_1 annotation(
      Placement(visible = true, transformation(origin = {-42, 26}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Seil Seil_2 annotation(
      Placement(visible = true, transformation(origin = {34, 26}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  equation
    connect(Decke1.Aufhaengung, Rolle1.Lager_Rolle_1) annotation(
      Line(points = {{-1, 99}, {-1, 80.8}, {-0.08, 80.8}, {-0.08, 65.8}}));
    connect(Rolle1.port_Seil_output, Seil_2.Seil_oben) annotation(
      Line(points = {{14, 66}, {34, 66}, {34, 47}}));
    connect(masse1.port_Masse, Seil_2.Seil_unten) annotation(
      Line(points = {{26, -26}, {26, -9.5}, {34, -9.5}, {34, 5}}));
    connect(hand1.Zug_Hand_F_s, Seil_1.Seil_unten) annotation(
      Line(points = {{-52, -54}, {-42, -54}, {-42, 8}, {-42, 8}}));
    connect(Rolle1.port_Seil_input, Seil_1.Seil_oben) annotation(
      Line(points = {{-14, 66}, {-42, 66}, {-42, 44}, {-42, 44}}));
  end Flaschenzug;

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
      Icon(graphics = {Rectangle(origin = {1, -1}, fillColor = {198, 159, 3}, fillPattern = FillPattern.Forward, extent = {{-5, 77}, {3, -75}})}));end Seil;

  model Flaschenzug_2
  Modelica_Gruppe_3_Flaschenzug.Decke decke1 annotation(
      Placement(visible = true, transformation(origin = {9, 19}, extent = {{-77, -77}, {77, 77}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {1, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle rolle1 annotation(
      Placement(visible = true, transformation(origin = {11, 3}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Masse masse1 annotation(
      Placement(visible = true, transformation(origin = {12, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil2 annotation(
      Placement(visible = true, transformation(origin = {23, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle rolle2 annotation(
      Placement(visible = true, transformation(origin = {34, 64}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil3 annotation(
      Placement(visible = true, transformation(origin = {45, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Hand hand1 annotation(
      Placement(visible = true, transformation(origin = {48, -24}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  equation
    connect(hand1.Zug_Hand_F_s, seil3.Seil_unten) annotation(
      Line(points = {{50, -26}, {44, -26}, {44, 16}, {46, 16}}));
    connect(rolle2.port_Seil_output, seil3.Seil_oben) annotation(
      Line(points = {{44, 64}, {46, 64}, {46, 58}, {46, 58}}));
    connect(rolle2.Lager_Rolle_1, decke1.Aufhaengung) annotation(
      Line(points = {{34, 64}, {0, 64}, {0, 72}, {0, 72}}));
    connect(seil2.Seil_oben, rolle2.port_Seil_input) annotation(
      Line(points = {{24, 58}, {24, 58}, {24, 64}, {24, 64}}));
    connect(seil2.Seil_unten, rolle1.port_Seil_output) annotation(
      Line(points = {{24, 16}, {22, 16}, {22, 4}, {22, 4}}));
    connect(rolle1.Lager_Rolle_1, masse1.port_Masse) annotation(
      Line(points = {{10, 4}, {12, 4}, {12, -40}, {12, -40}}));
    connect(seil1.Seil_unten, rolle1.port_Seil_input) annotation(
      Line(points = {{0, 16}, {0, 16}, {0, 4}, {0, 4}}));
    connect(decke1.Aufhaengung, seil1.Seil_oben) annotation(
      Line(points = {{0, 72}, {0, 57}, {1, 57}}));
  end Flaschenzug_2;

  model Flaschenzug_3
    Modelica_Gruppe_3_Flaschenzug.Decke decke1 annotation(
      Placement(visible = true, transformation(origin = {13, 161}, extent = {{-77, -77}, {77, 77}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {1, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Rolle rolle1 annotation(
      Placement(visible = true, transformation(origin = {11, 3}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Masse masse1 annotation(
      Placement(visible = true, transformation(origin = {32, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Seil seil2 annotation(
      Placement(visible = true, transformation(origin = {23, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Rolle rolle2 annotation(
      Placement(visible = true, transformation(origin = {34, 64}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Seil seil3 annotation(
      Placement(visible = true, transformation(origin = {45, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica_Gruppe_3_Flaschenzug.Hand hand1 annotation(
      Placement(visible = true, transformation(origin = {90, -34}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle rolle3 annotation(
      Placement(visible = true, transformation(origin = {54, 4}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil4 annotation(
      Placement(visible = true, transformation(origin = {67, 37}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Rolle rolle4 annotation(
      Placement(visible = true, transformation(origin = {79, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Seil seil5 annotation(
      Placement(visible = true, transformation(origin = {92, 38}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  equation
  connect(decke1.Aufhaengung, seil1.Seil_oben) annotation(
      Line(points = {{11, 87}, {11, 72}, {1, 72}, {1, 57}}));
  connect(rolle2.Lager_Rolle_1, decke1.Aufhaengung) annotation(
      Line(points = {{34, 64}, {11, 64}, {11, 87}}));
  connect(rolle4.Lager_Rolle_1, decke1.Aufhaengung) annotation(
      Line(points = {{78, 66}, {11, 66}, {11, 87}}));
    connect(seil5.Seil_unten, hand1.Zug_Hand_F_s) annotation(
      Line(points = {{92, 18}, {92, -37}}));
  connect(rolle3.Lager_Rolle_1, masse1.port_Masse) annotation(
      Line(points = {{54, 4}, {32, 4}, {32, -41}}));
  connect(rolle1.Lager_Rolle_1, masse1.port_Masse) annotation(
      Line(points = {{10, 4}, {32, 4}, {32, -41}}));
    connect(rolle4.port_Seil_output, seil5.Seil_oben) annotation(
      Line(points = {{88, 66}, {92, 66}, {92, 58}, {92, 58}}));
    connect(rolle4.port_Seil_input, seil4.Seil_oben) annotation(
      Line(points = {{70, 66}, {68, 66}, {68, 58}, {68, 58}}));
    connect(seil4.Seil_unten, rolle3.port_Seil_output) annotation(
      Line(points = {{68, 16}, {64, 16}, {64, 4}, {64, 4}}));
    connect(seil3.Seil_unten, rolle3.port_Seil_input) annotation(
      Line(points = {{46, 18}, {44, 18}, {44, 4}, {44, 4}}));
    connect(rolle2.port_Seil_output, seil3.Seil_oben) annotation(
      Line(points = {{44, 64}, {46, 64}, {46, 58}, {46, 58}}));
    connect(seil2.Seil_oben, rolle2.port_Seil_input) annotation(
      Line(points = {{24, 58}, {24, 58}, {24, 64}, {24, 64}}));
    connect(seil2.Seil_unten, rolle1.port_Seil_output) annotation(
      Line(points = {{24, 16}, {22, 16}, {22, 4}, {22, 4}}));
    connect(seil1.Seil_unten, rolle1.port_Seil_input) annotation(
      Line(points = {{0, 16}, {0, 16}, {0, 4}, {0, 4}}));
  end Flaschenzug_3;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Modelica_Gruppe_3_Flaschenzug;
