using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class Movement : MonoBehaviour
{
    //Vector2 i_movement;
    //[SerializeField] private PlayerControls _control;
    [Header("Speed Vars")]
    //value Variables
    public float moveSpeed, noise, maxNoise, echoNoise;
    public float walkSpeed, runSpeed, crouchSpeed, jumpSpeed;
    public static float _gravity = 20;
    //Struct - Contains Multiple Variables (eg...3 floats)
    private Vector3 _moveDir;
    //Reference Variable
    public PlayerHandler player;
    private CharacterController _charC;

    //public Slider noiseBar;
    //public Animator animator;
    private void Start()
    {
        _charC = GetComponent<CharacterController>();
        //want to make it do the capsule turns into a sphere when you press crouch thus lowering the profile
        //capsule.SetActive(true);
        _gravity = 20;
        noise = 6f;
        maxNoise = 24f;
    }
    
    private void Update()
    {
        //i_movement = _control.Player1.Move.ReadValue();
        Move();
        
    }
    private void OnEnable()
    {
        //_control.Player1.Jump.performed += Jump();
        //_control.Player1.Jump.Enable();
    }
    private void OnDisable()
    {
        //_control.Player1.Jump.performed -= Jump();
        
       // _control.Player1.Jump.Disable();
    }
    private void Jump()
    {
        _moveDir.y = jumpSpeed;
        noise = 18f;
    }
    private void Move()
    {
        if (_charC.isGrounded && !PlayerHandler.isDead)
        {
            //set speed
            if (Input.GetButton("Crouch"))
            {

                
                noise = 0f;
                moveSpeed = crouchSpeed;
            }

            else if (Input.GetButton("Sprint"))
            {

                
                moveSpeed = runSpeed;
                noise = 12f;
            }

            else
            {
                

                moveSpeed = walkSpeed;
                noise = 6f;
            }
            if (Input.GetAxis("Horizontal") == 0 && Input.GetAxis("Vertical") == 0)
            {
                
            }
            else if (!(Input.GetAxis("Horizontal") == 0 && Input.GetAxis("Vertical") == 0))
            {
                
            }
            _moveDir = transform.TransformDirection(new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")) * moveSpeed);
            if (Input.GetButton("Jump"))
            {
                Jump();
                
            }
        }
        if (PlayerHandler.isDead)
        {
            _moveDir = Vector3.zero;
        }

        _moveDir.y -= _gravity * Time.deltaTime;


        _charC.Move(_moveDir * Time.deltaTime);
    }

}
