﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotatingController : MonoBehaviour
{
    public float speed;
    void Update()
    {
        transform.Rotate(transform.up, speed);
    }
}
